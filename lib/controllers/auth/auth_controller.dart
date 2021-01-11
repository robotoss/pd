import 'package:aqueduct_pd/documents/auth_doc.dart';
import 'package:aqueduct_pd/helpers/database_helper.dart';
import 'package:aqueduct_pd/helpers/google_helper.dart';
import 'package:aqueduct_pd/helpers/security_helper.dart';
import 'package:aqueduct_pd/models/sql/user_model.dart';

import '../../aqueduct_pd.dart';

class AuthenticationController extends ResourceController {
  AuthenticationController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> authUser(
      @Bind.query('mobile_token') String mobileToken) async {
    final _dataBase = Database(context);

    if (mobileToken == null) {
      return Response.conflict(body: {"error": "Заполните данные"});
    }

    User userData;
    String phoneNumber;
    //  Проверяю тестовый ли это токен
    if (mobileToken ==
        'eyJhbGciOiJIUzI1NiJ9.eyJSb2xlIjoiQWRtaW4iLCJJc3N1ZXIiOiJJc3N1ZXIiLCJVc2VybmFtZSI6IkphdmFJblVzZSIsImV4cCI6MTYxMDE3NzY2NSwiaWF0IjoxNjEwMTc3NjY1fQ.QL8h_oNeH4k4jqb7QBU5eEJM-zHZ6Pqks7BNDgPhsuo') {
      phoneNumber = '+77990000000';
    } else {
      final googleData = await GoogleHelper().getUserData(mobileToken);

      if (googleData?.users == null) {
        return Response.serverError(body: {"error": "Произошла ошибка"});
      } else {
        phoneNumber = googleData.users.first.phoneNumber;
      }
    }
    // Пытаюсь найти пользователя в базе данных
    userData = await _dataBase.queryPhoneNumber(phoneNumber);

    if (userData == null) {
      // Создаю нового пользователя если данные не найдены
      await Database(context).registrationUserByPhone(
        phoneNumber,
        UserType.user,
      );
    }
    userData = await _dataBase.queryPhoneNumber(phoneNumber);
    // Получаю токен авторизации
    final token = SecurityHelper().signToken(userData.id);

    return Response.ok(
      {
        "auth_token": token,
        "user_data": {
          "id": userData.id,
          "role": userData.role.toString(),
          "name": userData.fullName,
          "address": userData.address,
          "phone_number": userData.phoneNumber,
          "img": userData.img,
          "email": userData.email,
        },
      },
    );
  }
}

@override
Map<String, APIResponse> documentOperationResponses(
    APIDocumentContext context, Operation operation) {
  if (operation.method == "POST") {
    return {
      "200": APIResponse.schema(
        "AuthRepository",
        context.schema.getObjectWithType(AuthRepository),
      ),
      "500": APIResponse.schema(
        "AuthRepositoryError",
        context.schema["AuthRepositoryError"],
      ),
      "409": APIResponse.schema(
        "AuthRepositoryError",
        context.schema["AuthRepositoryError"],
      )
    };
  }
  return null;
}

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

    final googleData = await GoogleHelper().getUserData(mobileToken);

    if (googleData?.users != null) {
      User userData;
      try {
        userData = await _dataBase
            .queryPhoneNumber(googleData.users.first.phoneNumber);
      } catch (e) {}

      if (userData == null) {
        // Создаю нового пользователя
        await Database(context).registrationUserByPhone(
          googleData.users.first.phoneNumber,
          3,
        );
      }
      userData =
          await _dataBase.queryPhoneNumber(googleData.users.first.phoneNumber);
      // Получаю токен авторизации
      final token = SecurityHelper().signToken(userData.id);

      return Response.ok(
        {
          "auth_token": token,
          "user_data": {
            "id": userData.id,
            "role": {
              "id": userData.userRole.id,
              "name_ru": userData.userRole.nameRu,
              "name_en": userData.userRole.nameEn,
            },
            "name": userData.fullName,
            "address": userData.address,
            "phone_number": userData.phoneNumber,
            "img": userData.img,
            "email": userData.email,
          },
        },
      );
    } else {
      return Response.serverError(body: {"error": "Произошла ошибка"});
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
}

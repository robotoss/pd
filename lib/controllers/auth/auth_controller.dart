import 'package:aqueduct_pd/helpers/database_helper.dart';
import 'package:aqueduct_pd/helpers/google_helper.dart';
import 'package:aqueduct_pd/helpers/security_helper.dart';
import 'package:aqueduct_pd/models/sql/user_model.dart';

import '../../aqueduct_pd.dart';

class AuthenticationController extends ResourceController {
  AuthenticationController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> authUser(@Bind.query('auth_token') String authToken) async {
    final _dataBase = Database(context);

    if (authToken == null) {
      return Response.conflict(body: {"error": "Заполните данные"});
    }

    final googleData = await GoogleHelper().getUserData(authToken);

    if (googleData != null) {
      User userData;
      try {
        userData = await _dataBase
            .queryPhoneNumber(googleData.users.first.phoneNumber);
      } catch (e) {
        return Response.serverError(body: {"error": "Произошла ошибка"});
      }

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

      return Response.ok({"token": token});
    } else {
      return Response.serverError(body: {"error": "Произошла ошибка"});
    }
  }
}

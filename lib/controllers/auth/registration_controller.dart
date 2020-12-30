import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/helpers/database_helper.dart';
import 'package:aqueduct_pd/models/request/auth_request_model.dart';

class RegistrationController extends ResourceController {
  RegistrationController(this.context);

  final ManagedContext context;

  // Регистрация нового пользователя
  @Operation.post()
  Future<Response> registration() async {
    // Обрабатываю что прислал клиент
    final map = await request.body.decode<Map<String, dynamic>>();
    final sendUserData = AuthRequest.fromJson(map);
    // Проверяю данные для регистрации
    if (sendUserData.email == null || sendUserData.password == null) {
      return Response.badRequest(headers: {
        "error_type": "blank_data",
      }, body: {
        "error": "Email или пароль отсутствуют."
      });
    } else if (sendUserData.password.length < 8) {
      return Response.badRequest(headers: {
        "error_type": "short_password",
      }, body: {
        "error": "Пароль должен состоять не менее чем из 8 символов."
      },);
    }

    if (await Database(context).queryEmail(sendUserData.email)) {
      // Создаю нового пользователя
      await Database(context).registrationUser(
        null,
        sendUserData.email,
        sendUserData.password,
        3,
        null,
      );
    } else {
      return Response.conflict(
        body: {
        "error": "Пользователь с таким Email уже существует."
      },
      );
    }

    return Response.ok('message: Пользователь успешно добавлен');
  }
}

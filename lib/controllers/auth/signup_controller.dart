import 'dart:convert';
import 'package:aqueduct_pd/helpers/database_helper.dart';
import 'package:aqueduct_pd/helpers/security_helper.dart';
import 'package:aqueduct_pd/models/request/auth_request_model.dart';
import 'package:crypto/crypto.dart';

import '../../aqueduct_pd.dart';

class SignupController extends ResourceController {
  SignupController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> restricted() async {
    final _dataBase = Database(context);
    // Достаю инфу из тела запроса
    final map = await request.body.decode<Map<String, dynamic>>();
    final authRequest = AuthRequest.fromJson(map);

    if (await _dataBase.queryEmail(authRequest.email)) {
      return Response.noContent();
    } else {
      // Вытаскиваю пользователя из базы
      final user = await _dataBase.getUserByEmail(authRequest.email);
      // Разбиваю пароль на части
      final parts = user.hashedPassword.split('.');
      final salt = parts[0];
      final savedHash = parts[1];

      // Проверяю Hash паролей
      final saltedPassword = salt + authRequest.password;
      final bytes = utf8.encode(saltedPassword);
      final newHash = sha256.convert(bytes).toString();
      // Если пароль верен
      if (savedHash == newHash) {
        // Получаю токен авторизации
        final token = SecurityHelper().signToken(user.id);

        return Response.ok({"token": token});
      } else {
        return Response.conflict(body: {"error": "Пароль или email не верный"});
      }
    }
  }
}

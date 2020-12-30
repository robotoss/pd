import 'dart:convert';

import 'package:aqueduct_pd/models/sql/user_model.dart';
import 'package:crypto/crypto.dart';

import '../aqueduct_pd.dart';

class Database {
  Database(this.context);

  final ManagedContext context;

  /// Проверка есть ли даный Email в базе
  Future<bool> queryEmail(String email) async {
    // Проверяю есть ли пользователь в базе
    final userQuery = Query<User>(context)
      ..where((u) => u.email).equalTo(email);

    final foundUser = await userQuery.fetchOne();

    if (foundUser == null) {
      return true;
    } else {
      return false;
    }
  }

  /// Вытаскиваю пользователя из базы
  Future<User> getUserByEmail(String email) async {
    // Проверяю есть ли пользователь в базе
    final userQuery = Query<User>(context)
      ..where((u) => u.email).equalTo(email);

    final foundUser = await userQuery.fetchOne();

    return foundUser;
  }

  /// Сохраняю пользователя в базу
  Future<void> registrationUser(String userName, String email, String password,
      int userRole, int vkID) async {
    // Хэширую пароль
    String _hashPassword(String password) {
      final salt = AuthUtility.generateRandomSalt();
      final saltedPassword = salt + password;
      final bytes = utf8.encode(saltedPassword);
      final hash = sha256.convert(bytes);
      // store the salt with the hash separated by a period
      return '$salt.$hash';
    }

    // Добавляю даннные модель
    final userQuery = Query<User>(context)
      ..values.fullName = userName
      ..values.email = email
      ..values.hashedPassword = _hashPassword(password)
      ..values.vkId = vkID.toString()
      ..values.userRole.id = userRole;
    // Сохраняю модель в базе
    await userQuery.insert();
  }
}

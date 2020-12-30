import 'dart:convert';

import 'package:aqueduct_pd/models/sql/user_model.dart';

import '../aqueduct_pd.dart';

class Database {
  Database(this.context);

  final ManagedContext context;

  /// Проверка есть ли даный Email в базе
  Future<User> queryEmail(String email) async {
    // Проверяю есть ли пользователь в базе
    final userQuery = Query<User>(context)
      ..where((u) => u.email).equalTo(email)..join(object: (a) => a.userRole);

    final foundUser = await userQuery.fetchOne();

    if (foundUser != null) {
      return foundUser;
    } else {
      return null;
    }
  }
}

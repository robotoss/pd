import 'package:aqueduct_pd/models/sql/user_model.dart';

import '../aqueduct_pd.dart';

class Database {
  Database(this.context);

  final ManagedContext context;

  /// Проверка есть ли даный Телефоный номер в базе
  Future<User> queryPhoneNumber(String phoneNumber) async {
    // Проверяю есть ли пользователь в базе
    final userQuery = Query<User>(context)
      ..where((u) => u.phoneNumber).equalTo(phoneNumber);

    final foundUser = await userQuery.fetchOne();

    if (foundUser != null) {
      return foundUser;
    } else {
      return null;
    }
  }

  /// Сохраняю пользователя в базу
  Future<void> registrationUserByPhone(String phoneNumber, int userRole) async {
    // Добавляю даннные модель
    final userQuery = Query<User>(context)
      ..values.phoneNumber = phoneNumber
      ..values.userRole.id = userRole;
    // Сохраняю модель в базе
    await userQuery.insert();
  }
}

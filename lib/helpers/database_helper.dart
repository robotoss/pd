import 'package:aqueduct_pd/models/request/user/user_model.dart';
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
  Future<void> registrationUserByPhone(
      String phoneNumber, UserType role) async {
    // Добавляю даннные модель
    final userQuery = Query<User>(context)
      ..values.phoneNumber = phoneNumber
      ..values.role = role;
    // Сохраняю модель в базе
    await userQuery.insert();
  }

  /// Поиск пользователя по id
  Future<User> getUserBuId(int userId) async {
    final userQuery = Query<User>(context)..where((u) => u.id).equalTo(userId);
    return await userQuery.fetchOne();
  }

  /// Обновляю данные пользователя
  Future<User> updateUser(
    int userId,
    UserRequst userRequst,
  ) async {
    final userQuery = Query<User>(context)..where((u) => u.id).equalTo(userId);

    // userQuery
    //   ..values.fullName = userRequst.userName
    //   ..values.address = userRequst.city
    //   ..values.email = userRequst.country;

    await userQuery.update();

    return userQuery.fetchOne();
  }
}

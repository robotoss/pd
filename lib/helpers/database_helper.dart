import 'package:aqueduct_pd/models/request/user/device_model.dart';
import 'package:aqueduct_pd/models/request/user/user_model.dart';
import 'package:aqueduct_pd/models/sql/user_cars_models.dart';
import 'package:aqueduct_pd/models/sql/user_model.dart';

import '../aqueduct_pd.dart';

class Database {
  Database(this.context);

  final ManagedContext context;

  /// Проверка есть ли даный Телефоный номер в базе
  Future<User> queryPhoneNumber(String phoneNumber) async {
    // Проверяю есть ли пользователь в базе
    final userQuery = Query<User>(context)
      ..where((u) => u.phoneNumber).equalTo(phoneNumber)
      ..join(set: (u) => u.cars);

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
    UserRequest userRequest,
  ) async {
    final userQuery = Query<User>(context)..where((u) => u.id).equalTo(userId);

    userQuery
      ..values.fullName = userRequest.fullName
      ..values.address = userRequest.address
      ..values.email = userRequest.email
      ..values.img = userRequest.img;

    await userQuery.update();

    return userQuery.fetchOne();
  }

  /// Обновляю данные поустройству
  Future<User> updateDevice(
    int userId,
    DeviceRequest deviceRequest,
  ) async {
    final userQuery = Query<User>(context)..where((u) => u.id).equalTo(userId);

    userQuery
      ..values.pushToken = deviceRequest.pushToken
      ..values.phoneModel = deviceRequest.phoneModel
      ..values.phoneOS = deviceRequest.phoneOS;

    await userQuery.update();

    return userQuery.fetchOne();
  }

  /// Поиск авто пользователя
  Future<List<UserCars>> getUserCars(int userId) async {
    final carsQuery = Query<UserCars>(context)
      ..where((u) => u.user.id).equalTo(userId);
    return await carsQuery.fetch();
  }

  /// Добавляю новый авто
  Future<void> addNewCar(
    int userId,
    UserCars car,
  ) async {
    final query = Query<UserCars>(context)
      ..values.user.id = userId
      ..values.carVin = car.carVin
      ..values.carName = car.carName
      ..values.carMark = car.carMark
      ..values.carLogoImg = car.carLogoImg
      ..values.carYear = car.carYear;

    await query.insert();
  }

  /// Удалить авто
  Future<void> deleteUserCars(int carId) async {
    final carsQuery = Query<UserCars>(context)
      ..where((u) => u.id).equalTo(carId);
    return await carsQuery.delete();
  }
}

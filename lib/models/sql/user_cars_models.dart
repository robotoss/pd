import 'package:aqueduct_pd/models/sql/user_model.dart';

import '../../aqueduct_pd.dart';

class UserCars extends ManagedObject<_UserCars> implements _UserCars {}

@Table(name: "_users_cars")
class _UserCars {
  @primaryKey
  int id;
  @Relate(#cars)
  User user;
  // @Column(nullable: true)
  // int userId;
  @Column(nullable: true)
  String carVin;
  @Column(nullable: true)
  String carName;
  @Column(nullable: true)
  String carMark;
  @Column(nullable: true)
  String carLogoImg;
  @Column(nullable: true)
  int carYear;
}

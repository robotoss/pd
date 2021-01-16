import '../../aqueduct_pd.dart';
import 'user_cars_models.dart';

enum UserType { admin, user, manager }

class User extends ManagedObject<_Users> implements _Users {}

@Table(name: "_users")
class _Users {
  @primaryKey
  int id;
  @Column(nullable: true)
  String fullName;
  @Column(nullable: false)
  UserType role;
  ManagedSet<UserCars> cars;
  @Column(nullable: true)
  String address;
  @Column(nullable: false)
  String phoneNumber;
  @Column(nullable: true, unique: true)
  String email;
  @Column(nullable: true)
  String pushToken;
  @Column(nullable: true)
  String img;
  @Column(nullable: true)
  String phoneModel;
  @Column(nullable: true)
  String phoneOS;
}

import 'package:aqueduct_pd/models/sql/user_model.dart';

import '../../aqueduct_pd.dart';

class UserRoleModel extends ManagedObject<_UserRole> implements _UserRole {}

@Table(name: "_user_roles")
class _UserRole {
  @primaryKey
  int id;
  String nameRu;
  String nameEn;

  ManagedSet<User> user;
}

import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/models/sql/user_model.dart';

class UserRequest extends Serializable {
  String fullName;
  String address;
  String email;
  String img;

  @override
  void readFromMap(Map<String, dynamic> map) {
    fullName = map['fullName'] as String;
    address = map['address'] as String;
    email = map['email'] as String;
    img = map['img'] as String;
  }

  @override
  Map<String, dynamic> asMap() {
    return {
      'fullName': fullName,
      'address': address,
      'email': email,
      'img': img,
    };
  }
}

class UserResponse extends Serializable {
  int id;
  UserType role;
  String name;
  String address;
  String img;
  String email;

  @override
  void readFromMap(Map<String, dynamic> map) {
    id = map['id'] as int;
    role = map['role'] as UserType;
    name = map['name'] as String;
    address = map['address'] as String;
    img = map['img'] as String;
    email = map['email'] as String;
  }

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'role': role,
      'name': name,
      'address': address,
      'img': img,
      'email': email,
    };
  }

  @override
  APISchemaObject documentSchema(APIDocumentContext context) {
    return APISchemaObject.object({
      "id": APISchemaObject.integer(),
      "role": APISchemaObject.string(),
      "name": APISchemaObject.string(),
      "address": APISchemaObject.string(),
      "img": APISchemaObject.string(),
      "email": APISchemaObject.string(),
    });
  }
}

import 'package:aqueduct_pd/aqueduct_pd.dart';

class UserRequest extends Serializable{
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
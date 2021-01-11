// class UserRequst {
//   UserRequst(this.userName, this.phoneNumber, this.city, this.country);

//   factory UserRequst.fromJson(Map<String, dynamic> json) {
//     if (json == null) {
//       throw const FormatException('Null JSON in User constructor');
//     }
//     return UserRequst(
//       json['userName'] as String,
//       json['phoneNumber'] as String,
//       json['city'] as String,
//       json['country'] as String,
//     );
//   }

//   String userName;
//   String phoneNumber;
//   String city;
//   String country;

//   Map<String, dynamic> toJson() {
//     return {
//       'userName': userName,
//       'phoneNumber': phoneNumber,
//       'city': city,
//       'country': country,
//     };
//   }
// }

import 'package:aqueduct_pd/aqueduct_pd.dart';

class UserRequst extends Serializable{
  String id;
  String name;

  @override
  void readFromMap(Map<String, dynamic> map) {
    id = map['id'] as String;
    name = map['name'] as String;
  }

  @override
  Map<String, dynamic> asMap() {
    return {
      'id': id,
      'name': name
    };
  }
}
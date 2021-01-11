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
import 'package:aqueduct_pd/aqueduct_pd.dart';

class DeviceRequest extends Serializable{
  String pushToken;
  String phoneModel;
  String phoneOS;

  @override
  void readFromMap(Map<String, dynamic> map) {
    pushToken = map['pushToken'] as String;
    phoneModel = map['phoneModel'] as String;
    phoneOS = map['phoneOS'] as String;
  }

  @override
  Map<String, dynamic> asMap() {
    return {
      'pushToken': pushToken,
      'phoneModel': phoneModel,
      'phoneOS': phoneOS,
      
    };
  }
}
import 'package:aqueduct_pd/aqueduct_pd.dart';

class CarModelMarkModel extends Serializable {
  String name;
  int value;

  @override
  void readFromMap(Map<String, dynamic> map) {
    name = map['name'] as String;
    value = map['value'] as int;
  }

  @override
  Map<String, dynamic> asMap() {
    return {
      'name': name,
      'value': value,
    };
  }

   @override
  APISchemaObject documentSchema(APIDocumentContext context) {
    return APISchemaObject.object({
      "name": APISchemaObject.string(),
      "value": APISchemaObject.integer(),
    });
  }
}

import 'package:aqueduct_pd/aqueduct_pd.dart';

import 'car_model_mark_model.dart';

class CarByVinModel extends Serializable {
  int activeMark;
  int activeModel;
  List<CarModelMarkModel> allMarks;
  List<CarModelMarkModel> allModels;

  @override
  void readFromMap(Map<String, dynamic> map) {
    activeMark = map['activeMark'] as int;
    activeModel = map['activeModel'] as int;
    allMarks = map['allMarks'] as List<CarModelMarkModel>;
    allModels = map['allModels'] as List<CarModelMarkModel>;
  }

  @override
  Map<String, dynamic> asMap() {
    return {
      'activeMark': activeMark,
      'activeModel': activeModel,
      'allMarks': allMarks,
      'allModels': allModels,
    };
  }

  @override
  APISchemaObject documentSchema(APIDocumentContext context) {
    return APISchemaObject.object({
      "activeMarkId": APISchemaObject.integer(),
      "activeModelId": APISchemaObject.integer(),
      "allMarks":
          APISchemaObject.array(ofSchema: context.schema["CarModelAndMark"]),
      "allModels":
          APISchemaObject.array(ofSchema: context.schema["CarModelAndMark"]),
    });
  }
}

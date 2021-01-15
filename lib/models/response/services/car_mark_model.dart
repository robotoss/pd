import 'dart:convert';

import 'package:aqueduct_pd/models/request/services/car_model_mark_model.dart';

List<CarModelMarkModel> carMarksOrModelFromJson(String str) {
  final data = json.decode(str);
  return List<CarModelMarkModel>.from(data.map((x) {
    final object = CarModelMarkModel();
    object.read(x as Map<String, dynamic>);
    return object;
  }).toList() as List<dynamic>);
}

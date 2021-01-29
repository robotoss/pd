import 'package:aqueduct_pd/aqueduct_pd.dart';

class PartModel extends Serializable {
  String catalogPartNumber;
  String brand;
  String name;
  String partId;
  String partnerStokId;
  String stokId;
  int avalibleCount;
  int returnDays;
  double minimumOrder;
  double probability;
  double price;
  String bestDeliveryDate;
  String worseDeliveryDate;
  bool isAnalog;

  @override
  void readFromMap(Map<String, dynamic> map) {
    catalogPartNumber = map['catalogPartNumber'] as String;
    brand = map['brand'] as String;
    name = map['name'] as String;
    partId = map['partId'] as String;
    partnerStokId = map['partnerStokId'] as String;
    stokId = map['stokId'] as String;
    avalibleCount = map['avalibleCount'] as int;
    returnDays = map['returnDays'] as int;
    minimumOrder = map['minimumOrder'] as double;
    probability = map['probability'] as double;
    price = map['price'] as double;
    bestDeliveryDate = map['bestDeliveryDate'] as String;
    worseDeliveryDate = map['worseDeliveryDate'] as String;
    isAnalog = map['isAnalog'] as bool;
  }

  @override
  Map<String, dynamic> asMap() {
    return {
      'catalogPartNumber': catalogPartNumber,
      'brand': brand,
      'name': name,
      'partId': partId,
      'partnerStokId': partnerStokId,
      'stokId': stokId,
      'avalibleCount': avalibleCount,
      'returnDays': returnDays,
      'minimumOrder': minimumOrder,
      'probability': probability,
      'price': price,
      'bestDeliveryDate': bestDeliveryDate,
      'worseDeliveryDate': worseDeliveryDate,
      'isAnalog': isAnalog, 
    };
  }

  // @override
  // APISchemaObject documentSchema(APIDocumentContext context) {
  //   return APISchemaObject.object({
  //     "activeMarkId": APISchemaObject.integer(),
  //     "activeModelId": APISchemaObject.integer(),
  //     "allMarks":
  //         APISchemaObject.array(ofSchema: context.schema["CarModelAndMark"]),
  //     "allModels":
  //         APISchemaObject.array(ofSchema: context.schema["CarModelAndMark"]),
  //   });
  // }
}

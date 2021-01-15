import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/helpers/database_helper.dart';
import 'package:aqueduct_pd/models/request/services/car_by_vin_model.dart';
import 'package:aqueduct_pd/models/request/services/car_model_mark_model.dart';
import 'package:aqueduct_pd/models/response/services/car_mark_model.dart';
import 'package:aqueduct_pd/models/response/services/vin_model.dart';
import 'package:http/http.dart' as http;

class VinController extends ResourceController {
  VinController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getVinInfo(@Bind.query('vin') String vinNumber) async {
    try {
      // Получаю данные авто по вин
      final _vinResponse = await http.get(
        'https://vpic.nhtsa.dot.gov/api/vehicles/DecodeVinValues/$vinNumber?format=json',
      );
      final carData = vinFromJson(_vinResponse.body);
      // Получаю Марки автомобилей
      final _carMarksResponse = await http.get(
        'http://api.auto.ria.com/categories/1/marks',
      );
      final carMarks = carMarksOrModelFromJson(_carMarksResponse.body);
      // Ищу активную марку авто по данным с вин
      final activeMark = carMarks
          .firstWhere((mark) => mark.name == carData.results.first.make);

      // Получаю Модели автомобилей
      final _carModelsResponse = await http.get(
        'http://api.auto.ria.com/categories/1/marks/${activeMark.value}/models',
      );
      final carModels = carMarksOrModelFromJson(_carModelsResponse.body);

      // Ищу активную модель авто по данным с вин
      final activeModel = carModels
          .firstWhere((model) => model.name == carData.results.first.model);

      return Response.ok({
        'activeMark': activeMark.value,
        'activeModel': activeModel.value,
        'carMarks': carMarks.map((e) => e.asMap()).toList(),
        'carModels': carModels.map((e) => e.asMap()).toList(),
      });
    } catch (e) {
      return Response.badRequest(body: {"error": "Произошла ошибка"});
    }
  }

  @override
  void documentComponents(APIDocumentContext context) {
    super.documentComponents(context);

    // final carModelMarkSchema = CarModelMarkModel().documentSchema(context);
    final carByVinModelSchema = CarByVinModel().documentSchema(context);
    // context.schema.register(
    //   "CarModelAndMark",
    //   carModelMarkSchema,
    //   representation: CarModelMarkModel,
    // );
    context.schema.register(
      "CarByVin",
      carByVinModelSchema,
      representation: CarByVinModel,
    );
  }

  @override
  Map<String, APIResponse> documentOperationResponses(
      APIDocumentContext context, Operation operation) {
    if (operation.method == "GET") {
      return {
        "200": APIResponse.schema(
          "Success",
          context.schema["CarByVin"],
        )
      };
    }
    return null;
  }
}

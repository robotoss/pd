import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/models/response/services/car_mark_model.dart';
import 'package:http/http.dart' as http;

class CarModelsController extends ResourceController {
  CarModelsController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getModels(@Bind.query('markId') int markId) async {
    try {
      // Получаю Модели автомобилей
      final _carModelsResponse = await http.get(
        'http://api.auto.ria.com/categories/1/marks/$markId/models',
      );
      final carModels = carMarksOrModelFromJson(_carModelsResponse.body);

      return Response.ok({
        'carMarks': carModels.map((e) => e.asMap()).toList(),
      });
    } catch (e) {
      return Response.badRequest(body: {"error": "Произошла ошибка"});
    }
  }

  @override
  Map<String, APIResponse> documentOperationResponses(
      APIDocumentContext context, Operation operation) {
    if (operation.method == "GET") {
      return {
        "200": APIResponse.schema(
          "Success",
          context.schema["CarModelAndMarkList"],
        )
      };
    }
    return null;
  }
}

import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/models/request/services/car_model_mark_model.dart';
import 'package:aqueduct_pd/models/response/services/car_mark_model.dart';
import 'package:http/http.dart' as http;

class CarMarksController extends ResourceController {
  CarMarksController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getMarks() async {
    try {
      final _carMarksResponse = await http.get(
        'http://api.auto.ria.com/categories/1/marks',
      );
      final carMarks = carMarksOrModelFromJson(_carMarksResponse.body);

      return Response.ok(
        carMarks.map((e) => e.asMap()).toList(),
      );
    } catch (e) {
      return Response.badRequest(body: {"error": "Произошла ошибка"});
    }
  }

  // @override
  // void documentComponents(APIDocumentContext context) {
  //   super.documentComponents(context);

  //   final carModelMarkSchema = CarModelMarkModel().documentSchema(context);
  //   context.schema.register(
  //     "CarModelAndMarkList",
  //     carModelMarkSchema,
  //     representation: CarModelMarkModel,
  //   );
  // }

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

import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/helpers/database_helper.dart';
import 'package:aqueduct_pd/models/request/user/user_model.dart';
import 'package:aqueduct_pd/models/sql/user_cars_models.dart';

class UserCarsController extends ResourceController {
  UserCarsController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getUserCars() async {
    final userId = int.parse(request.authorization.clientID);

    // Ищу все авто пользователя по его ID
    final cars = await Database(context).getUserCars(userId);

    if (cars == null) {
      return Response.badRequest(body: {"error": "Пользователь не найден"});
    } else if (cars.isEmpty) {
      return Response.noContent();
    } else {
      return Response.ok(
        cars.map((e) => e.asMap()).toList(),
      );
    }
  }

  @Operation.post()
  Future<Response> addUserCar(
    @Bind.body() UserCars car,
  ) async {
    final userId = int.parse(request.authorization.clientID);

    final cars = await Database(context).addNewCar(userId, car);

    return Response.ok(cars.asMap());
  }

  @Operation.delete()
  Future<Response> deleteUserCars(@Bind.query('car_id') int carId) async {
    // Удаляю авто из базы
    await Database(context).deleteUserCars(carId);

    return Response.ok({'message': 'Car delete'});
  }

  @override
  Map<String, APIResponse> documentOperationResponses(
      APIDocumentContext context, Operation operation) {
    if (operation.method == "GET") {
      return {
        "200": APIResponse.schema(
          "Success",
          APISchemaObject.array(ofSchema: UserCars().documentSchema(context)),
        )
      };
    } else if (operation.method == "POST") {
      return {
        "200": APIResponse.schema(
          "Success",
          UserCars().documentSchema(context),
        )
      };
    } else if (operation.method == "DELETE") {
      return {
        "200": APIResponse.schema(
          "Success",
          context.schema["Ok"],
        )
      };
    }
    return null;
  }
}

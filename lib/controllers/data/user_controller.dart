import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/helpers/database_helper.dart';
import 'package:aqueduct_pd/models/request/user/user_model.dart';

class UserController extends ResourceController {
  UserController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> getUserData() async {
    final userId = int.parse(request.authorization.clientID);

    // Ищу пользователя с указаным id
    final user = await Database(context).getUserBuId(userId);

    if (user == null) {
      return Response.badRequest(body: {"error": "Пользователь не найден"});
    } else {
      return Response.ok({
        "id": user.id,
        "role": user.role.toString(),
        "name": user.fullName,
        "address": user.address,
        "phone_number": user.phoneNumber,
        "img": user.img,
        "email": user.email,
      });
    }
  }

  @Operation.post()
  Future<Response> updateUserData(
    @Bind.body() UserRequest userRequest,
  ) async {
    final userId = int.parse(request.authorization.clientID);

    final newUserData = await Database(context).updateUser(userId, userRequest);

    return Response.ok({
      "id": newUserData.id,
      "role": newUserData.role.toString(),
      "name": newUserData.fullName,
      "address": newUserData.address,
      "phone_number": newUserData.phoneNumber,
      "img": newUserData.img,
      "email": newUserData.email,
    });
  }

  @override
  Map<String, APIResponse> documentOperationResponses(
      APIDocumentContext context, Operation operation) {
    if (operation.method == "GET") {
      return {
        "200": APIResponse.schema(
          "Success",
          context.schema["User"],
        )
      };
    } else if (operation.method == "POST") {
      return {
        "200": APIResponse.schema(
          "Success",
          context.schema["User"],
        )
      };
    }
    return null;
  }
}

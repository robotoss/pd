import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/documents/auth_doc.dart';
import 'package:aqueduct_pd/helpers/database_helper.dart';
import 'package:aqueduct_pd/helpers/security_helper.dart';
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
        "role": {
          "id": user.userRole.id,
          "name_ru": user.userRole.nameRu,
          "name_en": user.userRole.nameEn,
        },
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
    @Bind.header("authorization") String authToken,
    @Bind.body() UserRequst userRequest,
  ) async {
    print(userRequest);
    final userId = SecurityHelper().userIdByToken(authToken);
    // Если токен не активный то возращаю 401 ошибку
    if (userId == null) {
      return Response.unauthorized();
    }

    //  // Обрабатываю что прислал клиент
    // final map = await request.body.decode<Map<String, dynamic>>();
    // final UpdateUserData sendUserData = UpdateUserData.fromJson(map);
    // if(sendUserData == null){
    //   return Response.badRequest();
    // }

    //   // Ищу пользователя с указаным email
    //   final userQuery = Query<User>(context)
    //     ..where((u) => u.id).equalTo(int.parse(userId));

    //  await getUpdateUserData(userQuery, sendUserData).update();
    final newUserData = await Database(context).updateUser(userId, userRequest);
    return Response.ok({
      "id": newUserData.id,
      "role": {
        "id": newUserData.userRole.id,
        "name_ru": newUserData.userRole.nameRu,
        "name_en": newUserData.userRole.nameEn,
      },
      "name": newUserData.fullName,
      "address": newUserData.address,
      "phone_number": newUserData.phoneNumber,
      "img": newUserData.img,
      "email": newUserData.email,
    });
  }
}

@override
Map<String, APIResponse> documentOperationResponses(
    APIDocumentContext context, Operation operation) {
  if (operation.method == "POST") {
    return {
      "200": APIResponse.schema(
        "UserUpdate",
        context.schema.getObjectWithType(AuthRepository),
      ),
      "500": APIResponse.schema(
        "AuthRepositoryError",
        context.schema["AuthRepositoryError"],
      ),
      "409": APIResponse.schema(
        "AuthRepositoryError",
        context.schema["AuthRepositoryError"],
      )
    };
  }
  return null;
}

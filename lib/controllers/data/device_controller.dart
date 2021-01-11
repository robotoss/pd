import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/documents/auth_doc.dart';
import 'package:aqueduct_pd/helpers/database_helper.dart';
import 'package:aqueduct_pd/models/request/user/device_model.dart';

class DeviceController extends ResourceController {
  DeviceController(this.context);

  final ManagedContext context;

  @Operation.post()
  Future<Response> updateDeviceData(
    @Bind.body() DeviceRequest deviceRequest,
  ) async {
    final userId = int.parse(request.authorization.clientID);

    await Database(context).updateDevice(userId, deviceRequest);

    return Response.ok({"message": "Device data updated"});
  }
}

@override
Map<String, APIResponse> documentOperationResponses(
    APIDocumentContext context, Operation operation) {
  if (operation.method == "POST") {
    return {
      "200": APIResponse.schema(
        "AuthRepositoryOk",
        context.schema["AuthRepositoryError"],
      )
    };
  }
  return null;
}

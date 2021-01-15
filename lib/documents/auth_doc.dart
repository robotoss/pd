import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/models/request/services/car_model_mark_model.dart';

class AuthRepository implements APIComponentDocumenter {
  @override
  void documentComponents(APIDocumentContext context) {
    final oauth2 =
        APISecurityScheme.apiKey('Authorization', APIParameterLocation.header)
          ..description = "Standard OAuth 2.0";

    context.securitySchemes.register("oauth2", oauth2);

    final carModelMarkSchema = CarModelMarkModel().documentSchema(context);
    context.schema.register(
      'CarModelAndMark',
      carModelMarkSchema,
      representation: CarModelMarkModel,
    );

    context.schema.register(
      "CarModelAndMarkList",
      APISchemaObject.array(ofSchema: carModelMarkSchema),
      // representation: CarModelMarkModel,
    );

    context.schema.register(
      "UserWithToken",
      APISchemaObject.object({
        "auth_token": APISchemaObject.string(),
        // "user_data": APISchemaObject.map(
        //     ofSchema: context.schema.getObjectWithType(UserResponse))
        "user_data": APISchemaObject.object({
          "id": APISchemaObject.integer(),
          "role": APISchemaObject.string(),
          "name": APISchemaObject.string(),
          "address": APISchemaObject.string(),
          "phone_number": APISchemaObject.string(),
          "img": APISchemaObject.string(),
          "email": APISchemaObject.string(),
        })
      }),
    );

    context.schema.register(
        "Error", APISchemaObject.object({"error": APISchemaObject.string()}));

    context.schema.register(
        "Ok", APISchemaObject.object({"message": APISchemaObject.string()}));
  }
}

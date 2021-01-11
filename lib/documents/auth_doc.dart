import 'package:aqueduct_pd/aqueduct_pd.dart';

class AuthRepository implements APIComponentDocumenter {
  @override
  void documentComponents(APIDocumentContext context) {
    final oauth2 =
        APISecurityScheme.apiKey('Authorization', APIParameterLocation.header)
          ..description = "Standard OAuth 2.0";

    context.securitySchemes.register("oauth2", oauth2);

    context.schema.register(
        "AuthRepository",
        APISchemaObject.object({
          "auth_token": APISchemaObject.string(),
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
        representation: AuthRepository);

    context.schema.register(
        "UserUpdate",
        APISchemaObject.object({
          "auth_token": APISchemaObject.string(),
          "user_data": APISchemaObject.object({
            "id": APISchemaObject.integer(),
            "role": APISchemaObject.object({
              "id": APISchemaObject.integer(),
              "name_ru": APISchemaObject.string(),
              "name_en": APISchemaObject.string(),
            }),
            "name": APISchemaObject.string(),
            "address": APISchemaObject.string(),
            "phone_number": APISchemaObject.string(),
            "img": APISchemaObject.string(),
            "email": APISchemaObject.string(),
          })
        }),
        representation: AuthRepository);

    context.schema.register("AuthRepositoryError",
        APISchemaObject.object({"error": APISchemaObject.string()}));
  }
}

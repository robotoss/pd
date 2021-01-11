import 'package:aqueduct_pd/aqueduct_pd.dart';

class AuthRepository implements APIComponentDocumenter {
  @override
  void documentComponents(APIDocumentContext context) {

    final oauth2 =
        APISecurityScheme.apiKey('Authorization', APIParameterLocation.header)
          ..description = "Standard OAuth 2.0";

    context.securitySchemes.register("oauth2", oauth2);

    // context.document.servers = [APIServerDescription(Uri(host: '192.168.31.119'))];

    context.schema.register(
      "UserWithToken",
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
    );

    context.schema.register(
      "User",
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
    );

    context.schema.register("Error",
        APISchemaObject.object({"error": APISchemaObject.string()}));

    context.schema.register("Ok",
        APISchemaObject.object({"message": APISchemaObject.string()}));
  }
}

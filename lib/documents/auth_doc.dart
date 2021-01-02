import 'package:aqueduct_pd/aqueduct_pd.dart';

class SourceRepository implements APIComponentDocumenter {
  @override
  void documentComponents(APIDocumentContext context) {
    

     context.schema.register("SourceRepository",
        APISchemaObject.object({
          "auth_token": APISchemaObject.string()
        }), representation: SourceRepository);  
  }
}
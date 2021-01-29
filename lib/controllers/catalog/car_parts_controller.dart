import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/helpers/armtek_helper.dart';

class CarPartsController extends ResourceController {
  CarPartsController(this.context);

  final ManagedContext context;

  @Operation.get()
  Future<Response> updateCarPartsData(@Bind.query('partNumber') String partNumber) async {
   
     try {
       final parts = await ArmtekHelper().getPartsFromSerach(partNumber);
      if(parts != null){
         return Response.ok(parts);
      } else {
          return Response.badRequest(body: {"error": "Произошла ошибка"});
      }

    } catch (e) {
      return Response.badRequest(body: {"error": "Произошла ошибка"});
    }
  }
}


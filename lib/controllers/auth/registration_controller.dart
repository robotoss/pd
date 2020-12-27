import 'package:aqueduct_pd/aqueduct_pd.dart';
import 'package:aqueduct_pd/helpers/database_helper.dart';

class RegistrationController extends ResourceController {
  RegistrationController(this.context);

  final ManagedContext context;

  // Проверяю есть ли уже в базе такой email
  @Operation.get()
  Future<Response> checkUniqueEmail(@Bind.query('email') String email) async {
    // Проверяю Пользователя есть ли он в базе
    final foundUser = await Database(context).queryEmail(email);

    if (foundUser == null) {
      return Response.ok('message: Email avalible');
    } else {
      return Response.notFound();
    }
  }
}

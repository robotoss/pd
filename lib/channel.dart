import 'package:aqueduct_pd/aqueduct_pd.dart';

import 'controllers/auth/auth_controller.dart';
import 'controllers/data/device_controller.dart';
import 'controllers/data/user_controller.dart';
import 'controllers/services/vin_controller.dart';
import 'documents/auth_doc.dart';
import 'helpers/auth_validator.dart';
import 'helpers/configuration.dart';

/// This type initializes an application.
///
/// Override methods in this class to set up routes and initialize services like
/// database connections. See http://aqueduct.io/docs/http/channel/.
///

class AqueductPdChannel extends ApplicationChannel {
  /// Initialize services in this method.
  ///
  /// Implement this method to initialize services, read values from [options]
  /// and any other initialization required before constructing [entryPoint].
  ///
  /// This method is invoked prior to [entryPoint] being accessed.
  ManagedContext context;
  BasicValidator authServer;

  @override
  Future prepare() async {
    logger.onRecord.listen(
        (rec) => print("$rec ${rec.error ?? ""} ${rec.stackTrace ?? ""}"));

    final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    final persistentStore = PostgreSQLPersistentStore.fromConnectionInfo(
        "pd_admin", "Qazmlp1q2w3e4r!", "localhost", 5432, "pd_database");

    context = ManagedContext(dataModel, persistentStore);

    // final config = MyConfiguration(options.configurationFilePath);

    // final dataModel = ManagedDataModel.fromCurrentMirrorSystem();
    // final psc = PostgreSQLPersistentStore.fromConnectionInfo(
    //     config.database.username,
    //     config.database.password,
    //     config.database.host,
    //     config.database.port,
    //     config.database.databaseName);

    // context = ManagedContext(dataModel, psc);

    authServer = BasicValidator();
  }

  @override
  void documentComponents(APIDocumentContext context) {
    super.documentComponents(context);

    AuthRepository().documentComponents(context);
  }

  /// Construct the request channel.
  ///
  /// Return an instance of some [Controller] that will be the initial receiver
  /// of all [Request]s.
  ///
  /// This method is invoked after [prepare].
  @override
  Controller get entryPoint {
    final router = Router();

    router.route('/auth/login').link(() => AuthenticationController(context));

    router
        .route('/data/user')
        .link(() => Authorizer.bearer(authServer))
        .link(() => UserController(context));

    router
        .route('/data/device')
        .link(() => Authorizer.bearer(authServer))
        .link(() => DeviceController(context));
    
    router
        .route('/services/vin')
        .link(() => Authorizer.bearer(authServer))
        .link(() => VinController(context));

    return router;
  }
}

import 'package:aqueduct_pd/aqueduct_pd.dart';

Future main() async {
  final app = Application<AqueductPdChannel>()
  ..options.address ="192.168.31.119"
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  await app.startOnCurrentIsolate();

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}
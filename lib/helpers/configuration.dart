import 'dart:io';

import 'package:aqueduct/aqueduct.dart';

class MyConfiguration extends Configuration {
  MyConfiguration(String configPath) : super.fromFile(File(configPath));

  DatabaseConfiguration database;
}


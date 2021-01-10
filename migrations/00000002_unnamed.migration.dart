import 'dart:async';
import 'package:aqueduct/aqueduct.dart';   

class Migration2 extends Migration { 
  @override
  Future upgrade() async {
   		database.deleteColumn("_users", "appToken");
  }
  
  @override
  Future downgrade() async {}
  
  @override
  Future seed() async {}
}
    
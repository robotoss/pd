import 'dart:async';

import 'package:aqueduct_pd/models/request/google_auth_model.dart';
import 'package:aqueduct_pd/resources/google_res.dart';
import 'package:http/http.dart' as http;

class GoogleHelper {
  Future<GoogleAuth> getUserData(String idToken) async {
    try {
      final _googleRequest = await http.post(
        'https://identitytoolkit.googleapis.com/v1/accounts:lookup?key=${GoogleResource.fireBaseAppKey}',
        body: {'idToken': idToken},
      );
      return googleAuthFromJson(_googleRequest.body.toString());
    } catch (e) {
      return null;
    }
  }
}

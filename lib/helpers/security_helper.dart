import 'package:jaguar_jwt/jaguar_jwt.dart';

import 'config_helper.dart';

class SecurityHelper {
  // Создаю токен авторизации
  String signToken(int userId) {
    final claimSet = JwtClaim(
        issuer: 'Dart Server',
        subject: '$userId',
        issuedAt: DateTime.now(),
        maxAge: const Duration(days: 30));
    const String secret = Properties.jwtSecret;
    return issueJwtHS256(claimSet, secret);
  }
}

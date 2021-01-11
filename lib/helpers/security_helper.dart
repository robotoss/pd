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

  /// Проверяю токен польователя для авторизации
   int userIdByToken(String token) {

    const key = Properties.jwtSecret;

    try {
      final userId = verifyJwtHS256Signature(token, key).subject;
      return int.parse(userId);
    } on JwtException {
      print('invalid token');
      return null;
    }
    
  }
}

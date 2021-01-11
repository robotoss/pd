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
   int userIdByToken(String authHeader) {
    final parts = authHeader.split(' ');
    if (parts == null || parts.length != 2 || parts[0] != 'Bearer') {
      return null;
    }
    const key = Properties.jwtSecret;

    try {
      final userId = verifyJwtHS256Signature(parts[1], key).subject;
      return int.parse(userId);
    } on JwtException {
      print('invalid token');
    }
    return null;
  }
}

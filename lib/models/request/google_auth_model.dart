// To parse this JSON data, do
//
//     final googleAuth = googleAuthFromJson(jsonString);

import 'dart:convert';

GoogleAuth googleAuthFromJson(String str) =>
    GoogleAuth.fromJson(json.decode(str) as Map<String, dynamic>);

class GoogleAuth {
  GoogleAuth({
    this.kind,
    this.users,
  });

  final String kind;
  final List<User> users;

  factory GoogleAuth.fromJson(Map<String, dynamic> json) => GoogleAuth(
        kind: json["kind"] == null ? null : json["kind"] as String,
        users: json["users"] == null
            ? null
            : List<User>.from(json["users"]
                .map((x) => User.fromJson(x as Map<String, dynamic>))
                .toList() as List<dynamic>),
      );
}

class User {
  User({
    this.localId,
    this.providerUserInfo,
    this.lastLoginAt,
    this.createdAt,
    this.phoneNumber,
    this.lastRefreshAt,
  });

  final String localId;
  final List<ProviderUserInfo> providerUserInfo;
  final String lastLoginAt;
  final String createdAt;
  final String phoneNumber;
  final String lastRefreshAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        localId: json["localId"] == null ? null : json["localId"] as String,
        providerUserInfo: json["providerUserInfo"] == null
            ? null
            : List<ProviderUserInfo>.from(json["providerUserInfo"]
                .map(
                    (x) => ProviderUserInfo.fromJson(x as Map<String, dynamic>))
                .toList() as List<dynamic>),
        lastLoginAt:
            json["lastLoginAt"] == null ? null : json["lastLoginAt"] as String,
        createdAt:
            json["createdAt"] == null ? null : json["createdAt"] as String,
        phoneNumber:
            json["phoneNumber"] == null ? null : json["phoneNumber"] as String,
        lastRefreshAt: json["lastRefreshAt"] == null
            ? null
            : json["lastRefreshAt"] as String,
      );
}

class ProviderUserInfo {
  ProviderUserInfo({
    this.providerId,
    this.rawId,
    this.phoneNumber,
  });

  final String providerId;
  final String rawId;
  final String phoneNumber;

  factory ProviderUserInfo.fromJson(Map<String, dynamic> json) =>
      ProviderUserInfo(
        providerId:
            json["providerId"] == null ? null : json["providerId"] as String,
        rawId: json["rawId"] == null ? null : json["rawId"] as String,
        phoneNumber:
            json["phoneNumber"] == null ? null : json["phoneNumber"] as String,
      );
}

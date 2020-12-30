class AuthRequest {
  AuthRequest(this.email, this.password);

  factory AuthRequest.fromJson(Map<String, dynamic> json) {
    if (json == null) {
      throw const FormatException('Null JSON in Auth constructor');
    }
    return AuthRequest(
      json['email'] as String,
      json['password'] as String, 
    );
  }

  String email;
  String password;

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }
}

class RegistrationParams {
  final String username;
  final String password;
  final String email;

  const RegistrationParams({
    required this.username,
    required this.password,
    required this.email,
  });

  @override
  String toString() =>
      'RegistrationParams(username: $username, password: $password, email: $email)';

  // Add a copyWith method if you want to create modified copies
  RegistrationParams copyWith({
    String? username,
    String? password,
    String? email,
  }) {
    return RegistrationParams(
      username: username ?? this.username,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  // Convert to JSON (useful for APIs)
  Map<String, String> toJson() => {
        'username': username,
        'password': password,
        'email': email,
      };

  // Factory method to create an instance from JSON
  factory RegistrationParams.fromJson(Map<String, dynamic> json) {
    return RegistrationParams(
      username: json['username'] ?? '',
      password: json['password'] ?? '',
      email: json['email'] ?? '',
    );
  }
}

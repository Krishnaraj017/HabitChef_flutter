class EmailLoginParams {
  final String email;
  final String loginPassword;

  const EmailLoginParams({
    required this.email,
    required this.loginPassword,
  });

  @override
  String toString() =>
      'EmailLoginParams(email: $email, loginPassword: $loginPassword)';

  // Copy method for immutability
  EmailLoginParams copyWith({
    String? email,
    String? loginPassword,
  }) {
    return EmailLoginParams(
      email: email ?? this.email,
      loginPassword: loginPassword ?? this.loginPassword,
    );
  }

  // Convert to JSON
  Map<String, String> toJson() => {
        'email': email,
        'loginPassword': loginPassword,
      };

  // Create an instance from JSON
  factory EmailLoginParams.fromJson(Map<String, dynamic> json) {
    return EmailLoginParams(
      email: json['email'] ?? '',
      loginPassword: json['loginPassword'] ?? '',
    );
  }
}


class LoginResponse {
  final bool success;
  final String message;
  final String token;
  final User user;

  const LoginResponse({
    required this.success,
    required this.message,
    required this.token,
    required this.user,
  });

  // Factory method to create an instance from JSON
  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      success: json['success'],
      message: json['message'],
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'token': token,
      'user': user.toJson(),
    };
  }

  @override
  String toString() {
    return 'LoginResponse(success: $success, message: $message, token: $token, user: $user)';
  }
}

class User {
  final int id;
  final String username;
  final String email;

  const User({
    required this.id,
    required this.username,
    required this.email,
  });

  // Factory method to create an instance from JSON
  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      username: json['username'],
      email: json['email'],
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
    };
  }

  @override
  String toString() {
    return 'User(id: $id, username: $username, email: $email)';
  }
}

import 'package:habitchef/data/models/login_user_response.dart';

class RegisterUserResponse {
  final String message;
  final User user;
  final String token;

  const RegisterUserResponse({
    required this.message,
    required this.user,
    required this.token,
  });

  // Factory method to create an instance from JSON
  factory RegisterUserResponse.fromJson(Map<String, dynamic> json) {
    return RegisterUserResponse(
      message: json['message'],
      user: User.fromJson(json['user']),
      token: json['token'],
    );
  }

  // Convert instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'user': user.toJson(),
      'token': token,
    };
  }

  @override
  String toString() =>
      'RegisterUserResponse(message: $message, user: $user, token: $token)';
}

// class User {
//   final int id;
//   final String username;
//   final String password;
//   final String email;
//   final String updatedAt;
//   final String createdAt;

//   const User({
//     required this.id,
//     required this.username,
//     required this.password,
//     required this.email,
//     required this.updatedAt,
//     required this.createdAt,
//   });

//   // Factory method to create an instance from JSON
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'],
//       username: json['username'],
//       password: json['password'],
//       email: json['email'],
//       updatedAt: json['updatedAt'],
//       createdAt: json['createdAt'],
//     );
//   }

//   // Convert instance to JSON
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'username': username,
//       'password': password,
//       'email': email,
//       'updatedAt': updatedAt,
//       'createdAt': createdAt,
//     };
//   }

//   @override
//   String toString() {
//     return 'User(id: $id, username: $username, password: $password, email: $email, updatedAt: $updatedAt, createdAt: $createdAt)';
//   }
// }

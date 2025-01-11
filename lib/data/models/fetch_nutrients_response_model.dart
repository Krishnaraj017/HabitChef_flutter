class FetchFoodResponseModel {
  final String message;
  final Nutrients nutrients;

  FetchFoodResponseModel({
    required this.message,
    required this.nutrients,
  });

  factory FetchFoodResponseModel.fromJson(Map<String, dynamic> json) {
    return FetchFoodResponseModel(
      message: json['message'] as String,
      nutrients: Nutrients.fromJson(json['nutrients'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'nutrients': nutrients.toJson(),
    };
  }
}

class Nutrients {
  final List<String> vitamins;
  final List<String> minerals;
  final List<String> antioxidants;
  final List<String> prosForMen;
  final List<String> consForMen;
  final List<String> prosForWomen;
  final List<String> consForWomen;
  final int id;
  final double proteins;
  final double carbohydrates;
  final double healthyFats;
  final double fiber;
  final String description;
  final String name;
  final String nutritientType;
  final DateTime createdAt;
  final DateTime updatedAt;

  Nutrients({
    required this.vitamins,
    required this.minerals,
    required this.antioxidants,
    required this.prosForMen,
    required this.consForMen,
    required this.prosForWomen,
    required this.consForWomen,
    required this.id,
    required this.proteins,
    required this.carbohydrates,
    required this.healthyFats,
    required this.fiber,
    required this.description,
    required this.name,
    required this.nutritientType,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Nutrients.fromJson(Map<String, dynamic> json) {
    return Nutrients(
      vitamins: List<String>.from(json['vitamins'] as List),
      minerals: List<String>.from(json['minerals'] as List),
      antioxidants: List<String>.from(json['antioxidants'] as List),
      prosForMen: List<String>.from(json['prosForMen'] as List),
      consForMen: List<String>.from(json['consForMen'] as List),
      prosForWomen: List<String>.from(json['prosForWomen'] as List),
      consForWomen: List<String>.from(json['consForWomen'] as List),
      id: json['id'] as int,
      proteins: (json['proteins'] as num).toDouble(),
      carbohydrates: (json['carbohydrates'] as num).toDouble(),
      healthyFats: (json['healthyFats'] as num).toDouble(),
      fiber: (json['fiber'] as num).toDouble(),
      description: json['description'] as String,
      name: json['name'] as String,
      nutritientType: json['nutritientType'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'vitamins': vitamins,
      'minerals': minerals,
      'antioxidants': antioxidants,
      'prosForMen': prosForMen,
      'consForMen': consForMen,
      'prosForWomen': prosForWomen,
      'consForWomen': consForWomen,
      'id': id,
      'proteins': proteins,
      'carbohydrates': carbohydrates,
      'healthyFats': healthyFats,
      'fiber': fiber,
      'description': description,
      'name': name,
      'nutritientType': nutritientType,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}

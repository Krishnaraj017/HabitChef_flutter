class FetchFoodResponse {
  final String message;
  final List<Food> foods;

  FetchFoodResponse({
    required this.message,
    required this.foods,
  });

  factory FetchFoodResponse.fromJson(Map<String, dynamic> json) {
    return FetchFoodResponse(
      message: json['message'] as String,
      foods: (json['foods'] as List<dynamic>)
          .map((food) => Food.fromJson(food as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'foods': foods.map((food) => food.toJson()).toList(),
    };
  }
}

class Food {
  final int id;
  final String name;

  Food({
    required this.id,
    required this.name,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      id: json['id'] as int,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}

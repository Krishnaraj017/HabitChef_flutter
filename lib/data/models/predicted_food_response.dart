class PredictedFoodResponse {
  String message;
  List<String> predictedFoods;
  List<NutrientInfo> nutrients;

  PredictedFoodResponse({
    required this.message,
    required this.predictedFoods,
    required this.nutrients,
  });

  factory PredictedFoodResponse.fromJson(Map<String, dynamic> json) {
    var predictedFoodsList = json['predictedFoods'] as List;
    List<String> predictedFoods =
        predictedFoodsList.map((item) => item as String).toList();

    var nutrientsList = json['nutrients'] as List;
    List<NutrientInfo> nutrients =
        nutrientsList.map((item) => NutrientInfo.fromJson(item)).toList();

    return PredictedFoodResponse(
      message: json['message'] ?? '',
      predictedFoods: predictedFoods,
      nutrients: nutrients,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> nutrientsJson =
        nutrients.map((nutrient) => nutrient.toJson()).toList();

    return {
      'message': message,
      'predictedFoods': predictedFoods,
      'nutrients': nutrientsJson,
    };
  }
}

class NutrientInfo {
  List<String> vitamins;
  List<String> minerals;
  List<String> antioxidants;
  List<String> prosForMen;
  List<String> consForMen;
  List<String> prosForWomen;
  List<String> consForWomen;
  int id;
  double proteins;
  double carbohydrates;
  double healthyFats;
  double fiber;
  String description;
  String name;
  String nutritientType;
  DateTime createdAt;
  DateTime updatedAt;

  NutrientInfo({
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

  factory NutrientInfo.fromJson(Map<String, dynamic> json) {
    var vitaminsList = json['vitamins'] as List;
    List<String> vitamins = vitaminsList.map((item) => item as String).toList();

    var mineralsList = json['minerals'] as List;
    List<String> minerals = mineralsList.map((item) => item as String).toList();

    var antioxidantsList = json['antioxidants'] as List;
    List<String> antioxidants =
        antioxidantsList.map((item) => item as String).toList();

    var prosForMenList = json['prosForMen'] as List;
    List<String> prosForMen =
        prosForMenList.map((item) => item as String).toList();

    var consForMenList = json['consForMen'] as List;
    List<String> consForMen =
        consForMenList.map((item) => item as String).toList();

    var prosForWomenList = json['prosForWomen'] as List;
    List<String> prosForWomen =
        prosForWomenList.map((item) => item as String).toList();

    var consForWomenList = json['consForWomen'] as List;
    List<String> consForWomen =
        consForWomenList.map((item) => item as String).toList();

    return NutrientInfo(
      vitamins: vitamins,
      minerals: minerals,
      antioxidants: antioxidants,
      prosForMen: prosForMen,
      consForMen: consForMen,
      prosForWomen: prosForWomen,
      consForWomen: consForWomen,
      id: json['id'] ?? 0,
      proteins: json['proteins'] ?? 0.0,
      carbohydrates: json['carbohydrates'] ?? 0.0,
      healthyFats: json['healthyFats'] ?? 0.0,
      fiber: json['fiber'] ?? 0.0,
      description: json['description'] ?? '',
      name: json['name'] ?? '',
      nutritientType: json['nutritientType'] ?? '',
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
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

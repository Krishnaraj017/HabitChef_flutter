class ApiConstants {
  ApiConstants._();

  static const String basePath = "https://habit-chef-node-js.vercel.app/";
  static const String login = "/api/users/login";
  static const String register = "/api/users/createUser";
  static const String searchFoodWithImage = "/api/foods/getWithImage";
  static const String getNutrientsOfFood = "/api/foods/searchByFoodName";
  static const String searchFoodNames = 'api/foods/searchFoodNames';
  static const String addConsumedFoods = 'api/foods/addConsumedFood';
  static const String getConsumedFoods = 'api/foods/getConsumedFoods';
}

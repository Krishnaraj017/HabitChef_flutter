
import 'package:habitchef/data/models/predicted_food_response.dart';

abstract class CameraState  {}

class CameraInitial extends CameraState {}

class CameraInitialized extends CameraState {}

class CameraPictureTaken extends CameraState {
  final String imagePath;

  CameraPictureTaken(this.imagePath);
}

class CameraPicturePicked extends CameraState {
  final String imagePath;

  CameraPicturePicked(this.imagePath);
}

class CameraUploadSuccess extends CameraState {
  final PredictedFoodResponse predictedFoodResponse;
  CameraUploadSuccess(this.predictedFoodResponse);
}

class CameraError extends CameraState {
  final String message;

  CameraError(this.message);
}

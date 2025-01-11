import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:camera/camera.dart';
import 'package:dio/dio.dart';
import 'package:habitchef/data/models/predicted_food_response.dart';
import 'package:habitchef/presentation/cubits/camera/camera_state.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

class CameraCubit extends Cubit<CameraState> {
  CameraCubit() : super(CameraInitial());

  late List<CameraDescription> cameras;
  late CameraController controller;
  late XFile file;
  late CameraImage cameraImage;
  Future<void> initializeCamera() async {
    try {
      cameras = await availableCameras();
      controller = CameraController(cameras[0], ResolutionPreset.max);
      await controller.initialize();
      emit(CameraInitialized());
    } catch (e) {
      emit(CameraError('Failed to initialize camera: $e'));
    }
  }

  Future<void> takePicture() async {
    try {
      // Capture the image
      file = await controller.takePicture();

      // Create a Dio instance
      Dio dio = Dio();

      // Create a FormData object to send the image file
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          file.path,
          filename: 'image.png', // Same file name as in Python example
          contentType:
              MediaType('image', 'png'), // ERnsure correct content type
        ),
      });

      // API endpoint
      String apiUrl = 'http://192.168.19.25:3000/api/Foods/getWithImage';

      // Prepare headers with Authorization token
      Options options = Options(
        headers: {
          "Authorization":
              "Bearer your_token_here", // Use the correct token here
        },
      );

      // Send the image to the backend
      var response = await dio.post(apiUrl, data: formData, options: options);
      print(response);
      if (response.statusCode == 200) {
          var res = PredictedFoodResponse.fromJson(response.data);
          print(res);
          emit(CameraUploadSuccess(res));
        // Request was successful
      } else if (response.statusCode == 422) {
      } else {
        // Request failed
      }
    } catch (e) {}
  }

  Future<void> pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        emit(CameraPicturePicked(pickedFile.path));

        // Upload the image
        await uploadImage(pickedFile.path);
      }
    } catch (e) {
      emit(CameraError('Failed to pick image: $e'));
    }
  }

  Future<void> uploadImage(String filePath) async {
    try {
      final dio = Dio();
      final formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          filePath,
          filename: 'image.jpg',
          contentType: MediaType('image', 'jpeg'),
        ),
      });
      const apiUrl = 'http://192.168.19.25:3000/api/foods/getWithImage';
      Options options = Options(
        headers: {
          "Authorization":
              "Bearer your_token_here", // Use the correct token here
        },
      );

      final response = await dio.post(apiUrl, data: formData, options: options);
      if (response.statusCode == 200) {
        var res = PredictedFoodResponse.fromJson(response.data);
        emit(CameraUploadSuccess(res));
      } else {
        emit(CameraError(
            'Failed to upload image. Status code: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CameraError('Failed to upload image: $e'));
    }
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }
}

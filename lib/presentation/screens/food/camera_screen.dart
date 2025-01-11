import 'package:auto_route/auto_route.dart';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:habitchef/presentation/cubits/camera/camera_cubit.dart';
import 'package:habitchef/presentation/cubits/camera/camera_state.dart';

@RoutePage()
class CameraScreen extends StatelessWidget {
  const CameraScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CameraCubit()..initializeCamera(),
      child: BlocConsumer<CameraCubit, CameraState>(
        listener: (context, state) {
          if (state is CameraUploadSuccess) {
            // Extract the response data
            var response = state.predictedFoodResponse;

            // Show the response in a structured dialog
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Food Identification Result'),
                  content: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Message: ${response.message}",
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Predicted Foods: ${response.predictedFoods.join(", ")}",
                        ),
                        const SizedBox(height: 16),
                        ...response.nutrients.map((nutrient) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Name: ${nutrient.name}",
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              ),
                              Text("Description: ${nutrient.description}"),
                              const SizedBox(height: 8),
                              Text("Vitamins: ${nutrient.vitamins.join(", ")}"),
                              Text("Minerals: ${nutrient.minerals.join(", ")}"),
                              Text(
                                  "Antioxidants: ${nutrient.antioxidants.join(", ")}"),
                              const SizedBox(height: 8),
                              Text(
                                  "Pros for Men: ${nutrient.prosForMen.join(", ")}"),
                              Text(
                                  "Cons for Men: ${nutrient.consForMen.join(", ")}"),
                              const SizedBox(height: 8),
                              Text(
                                  "Pros for Women: ${nutrient.prosForWomen.join(", ")}"),
                              Text(
                                  "Cons for Women: ${nutrient.consForWomen.join(", ")}"),
                              const SizedBox(height: 8),
                              Text("Proteins: ${nutrient.proteins}g"),
                              Text("Carbohydrates: ${nutrient.carbohydrates}g"),
                              Text("Healthy Fats: ${nutrient.healthyFats}g"),
                              Text("Fiber: ${nutrient.fiber}g"),
                              const Divider(),
                            ],
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          } else if (state is CameraError) {
            // Show error dialog if necessary
            showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: const Text('Error'),
                  content: Text(state.message),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: const Text('OK'),
                    ),
                  ],
                );
              },
            );
          }
        },
        builder: (context, state) {
          final cubit = context.read<CameraCubit>();

          if (state is CameraInitial ||
              state is CameraInitialized &&
                  !cubit.controller.value.isInitialized) {
            return const Center(child: CircularProgressIndicator());
          }

          if (state is CameraError) {
            return Center(child: Text(state.message));
          }

          return Scaffold(
            body: Column(
              children: [
                Expanded(
                  child: CameraPreview(cubit.controller),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () => cubit.takePicture(),
                      child: const Text('Take Picture'),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () => cubit.pickImage(),
                  child: const Text('Pick Image'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

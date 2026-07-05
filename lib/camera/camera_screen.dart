import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rahhal_app/camera/recognition_result_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../api/ai_recognition_api.dart';
import '../main.dart';
import '../utils/token_storage.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() =>
      _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  final ImagePicker picker = ImagePicker();

  late CameraController controller;
  bool isCameraReady = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {

    controller = CameraController(
      cameras.first,
      ResolutionPreset.high,
    );

    await controller.initialize();

    setState(() {
      isCameraReady = true;
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  Future<void> takePicture() async {
    if (!controller.value.isInitialized) return;

    final XFile image = await controller.takePicture();
    String? token = await TokenStorage.getToken();


    var result = await recognizeImage(
      File(image.path),
      token!,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecognitionResultScreen(
          imageFile: File(image.path),
          result: result,
        ),
      ),
    );
  }
  Future<void> pickImageFromGallery() async {
    print("Gallery button Pressed");
    final XFile image = await controller.takePicture();
    String? token = await TokenStorage.getToken();


    var result = await recognizeImage(
      File(image.path),
      token!,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => RecognitionResultScreen(
          imageFile: File(image.path),
          result: result,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    if (!isCameraReady) {
      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [

          /// Camera Preview
          Positioned.fill(
            child: CameraPreview(controller),
          ),

          /// Overlay
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.25),
            ),
          ),

          SafeArea(
            child: Column(
              children: [

                /// Top Bar
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 10,
                  ),
                  child: Row(
                    children: [

                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),

                      const SizedBox(width: 10),

                      const Text(
                        "Scan Monument",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),

                const Spacer(),

                /// Scan Frame
                Container(
                  width: 260,
                  height: 260,
                  decoration: BoxDecoration(
                    borderRadius:
                    BorderRadius.circular(20),
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                  ),
                ),

                const SizedBox(height: 25),

                const Text(
                  "Point your camera at a monument to identify it",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),

                const Spacer(),

                /// Capture Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    // زر اختيار صورة من المعرض
                    GestureDetector(
                      onTap: pickImageFromGallery,
                      child: Container(
                        width: 55,
                        height: 55,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.cyan,
                          size: 30,
                        ),
                      ),
                    ),

                    const SizedBox(width: 25),

                    // زر التصوير
                    GestureDetector(
                      onTap: takePicture,
                      child: Container(
                        width: 85,
                        height: 85,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white70,
                            width: 4,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 40),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
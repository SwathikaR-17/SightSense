import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../services/tts_service.dart';
import 'dart:async';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  final TTSService ttsService = TTSService();
  Timer? obstacleTimer;
  CameraController? _cameraController;
  List<CameraDescription>? cameras;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  Future<void> initializeCamera() async {
    cameras = await availableCameras();

    _cameraController = CameraController(
      cameras![0],
      ResolutionPreset.medium,
    );

    await _cameraController!.initialize();

    await ttsService.speak(
      "Camera initialized successfully",
    );
    startObstacleSimulation();

    if (!mounted) return;

    setState(() {
      isCameraInitialized = true;
    });
  }

void startObstacleSimulation() {

  obstacleTimer = Timer.periodic(
    const Duration(seconds: 8),
    (timer) async {

      await ttsService.speak(
        "Obstacle detected ahead. Move slightly to the left.",
      );

    },
  );
}

  @override
  void dispose() {
    obstacleTimer?.cancel();
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('SightSense Camera'),
        centerTitle: true,
      ),
      body: isCameraInitialized
          ? CameraPreview(_cameraController!)
          : const Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
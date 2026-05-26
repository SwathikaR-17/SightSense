import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../services/tts_service.dart';
import 'dart:async';
import '../services/ai_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  final TTSService ttsService = TTSService();
  final AIService aiService = AIService();
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

  try {

    print("Getting cameras...");

    cameras = await availableCameras();

    print("Initializing controller...");

    _cameraController = CameraController(
      cameras![0],
      ResolutionPreset.medium,
    );

    await _cameraController!.initialize();

    print("Camera initialized");

    print("Loading AI model...");

    await aiService.loadModel();

    print("AI model loaded");

    await ttsService.speak(
      "Camera initialized successfully",
    );

    startObstacleSimulation();

    if (!mounted) return;

    setState(() {
      isCameraInitialized = true;
    });

  } catch (e) {

    print("ERROR: $e");

  }
}

void startObstacleSimulation() {

  obstacleTimer = Timer.periodic(
    const Duration(seconds: 8),
    (timer) async {

      print("CHECKING AI");

      aiService.runFakeDetection();

      await ttsService.speak(
        "AI detection running",
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
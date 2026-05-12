import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
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

    if (!mounted) return;

    setState(() {
      isCameraInitialized = true;
    });
  }

  @override
  void dispose() {
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
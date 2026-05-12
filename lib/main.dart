import 'package:flutter/material.dart';
import 'features/obstacle_detection/presentation/camera_screen.dart';

void main() {
  runApp(const SightSenseApp());
}

class SightSenseApp extends StatelessWidget {
  const SightSenseApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SightSense',
      theme: ThemeData.dark(),
      home: CameraScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SightSense'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'AI Vision Assistant for Accessibility',
          style: TextStyle(fontSize: 20),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
import 'package:tflite_flutter/tflite_flutter.dart';

class AIService {

  Interpreter? interpreter;

  Future<void> loadModel() async {

    try {

      interpreter = await Interpreter.fromAsset(
        'assets/models/detect.tflite',
      );

      print("MODEL LOADED SUCCESSFULLY");

    } catch (e) {

      print("MODEL FAILED: $e");

    }

  }

  void runFakeDetection() {

    if (interpreter == null) {

      print("AI MODEL NOT LOADED");
      return;

    }

    print("AI STARTED");

    // fake input/output for testing
    var input = [
      [0.0]
    ];

    var output = [
      [0.0]
    ];

    interpreter!.run(input, output);

    print("AI FINISHED");
    print(output);

  }
}
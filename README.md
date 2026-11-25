# SightSense 👁️

### An AI-Powered Assistive Vision Application for the Visually Impaired

SightSense is an early-stage project aimed at developing an AI-powered mobile application that helps blind and visually impaired individuals understand their surroundings.

The idea is to enable users to point their smartphone camera towards the environment in front of them and receive **spoken descriptions of the objects, people, and surroundings detected by the application**.

By combining Artificial Intelligence, Computer Vision, and Text-to-Speech technology, SightSense aims to make everyday navigation and environmental awareness more accessible and independent for visually impaired individuals.

<badge>Early-Stage Project · Work in Progress</badge>

---

## 🎯 Problem Statement

Blind and visually impaired individuals often face challenges in understanding their immediate surroundings, identifying objects, and becoming aware of potential obstacles.

SightSense aims to address this problem through an intelligent mobile application that can:

- Observe the user's surroundings through a smartphone camera.
- Identify and recognize objects in front of the user.
- Interpret visual information using AI and Computer Vision.
- Convert the interpreted information into natural spoken descriptions.
- Provide useful audio feedback to improve environmental awareness.

## 💡 Project Vision

The long-term vision is to develop a real-time AI vision assistant that acts as an additional source of environmental information for visually impaired users.

For example, the application could describe a scene by providing feedback such as:

- "There is a chair in front of you."
- "A person is standing to your left."
- "There is an obstacle ahead."

These are illustrative examples of the intended functionality, not currently implemented capabilities.

## 🚧 Current Development Status

SightSense is currently in its **initial development stage**. The project establishes the basic mobile application structure and integrates some of the foundational components required for the intended solution.

### Currently Implemented

- Flutter-based mobile application.
- Camera initialization and live camera preview.
- TensorFlow Lite model loading.
- Basic text-to-speech integration.
- Separate services for AI model handling and audio feedback.

### Under Development / Planned

The major AI development required to achieve the project's vision is still pending.

- Real-time object detection using camera frames.
- Computer Vision-based object recognition.
- Scene understanding and contextual description.
- Obstacle identification and spatial awareness.
- Distance estimation and directional guidance.
- AI-powered scene descriptions.
- Real-time spoken feedback based on visual observations.

The project will require further exploration and integration of suitable Computer Vision models, AI techniques, and supporting technologies to achieve these capabilities.

## 🏗️ Current Project Structure

```text
SightSense/
│
├── assets/
│   └── models/
│       ├── detect.tflite
│       └── labelmap.txt
│
├── lib/
│   ├── features/
│   │   └── obstacle_detection/
│   │       ├── presentation/
│   │       │   └── camera_screen.dart
│   │       │
│   │       └── services/
│   │           ├── ai_service.dart
│   │           └── tts_service.dart
│   │
│   └── main.dart
│
├── pubspec.yaml
└── README.md
```

## 🛠️ Current Tech Stack

| Component | Technology |
|---|---|
| Mobile Framework | Flutter |
| Programming Language | Dart |
| Camera Integration | Flutter Camera |
| Machine Learning Model | TensorFlow Lite |
| Model Integration | tflite_flutter |
| Audio Feedback | flutter_tts |
| Permissions | permission_handler |

### Technologies to Explore

Depending on the final implementation, the project may involve:

- Computer Vision and Deep Learning.
- Real-time object detection models.
- Image processing and scene understanding.
- Object localization and distance estimation.
- Natural Language Generation for scene descriptions.
- Text-to-Speech for accessible audio feedback.

## ⚙️ Getting Started

### Prerequisites

- Flutter SDK
- Dart SDK
- Android Studio or VS Code
- Android device or emulator with camera support

### 1. Clone the Repository

```bash
git clone https://github.com/SwathikaR-17/SightSense.git

cd SightSense
```

### 2. Install Dependencies

```bash
flutter pub get
```

### 3. Run the Application

Connect an Android device or start an emulator:

```bash
flutter run
```

## 🚀 Future Goals

The broader goal is to evolve SightSense into a reliable, real-time assistive vision application.

Future development will focus on:

1. Integrating real-time Computer Vision pipelines.
2. Detecting and recognizing objects from live camera input.
3. Understanding scenes and generating meaningful descriptions.
4. Identifying nearby obstacles and estimating their positions.
5. Providing contextual audio feedback and directional guidance.
6. Improving performance and accessibility for everyday mobile use.

## 👩‍💻 Author

**Swathi**

Computer Science Engineering | AI & Machine Learning

GitHub: [@SwathikaR-17](https://github.com/SwathikaR-17)

---

*SightSense — Helping visually impaired individuals perceive and understand the world around them through AI.*

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  @override
  _CameraScreenState createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras; // To store available cameras
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    initializeCamera();
  }

  // Initialize the camera
  Future<void> initializeCamera() async {
    cameras = await availableCameras();
    if (cameras != null && cameras!.isNotEmpty) {
      _cameraController = CameraController(
        cameras![0], // Use the first camera (usually the rear camera)
        ResolutionPreset.high,
      );
      _cameraController!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {
          isCameraInitialized = true;
        });
      });
    }
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  // Function to capture a photo
  Future<void> capturePhoto() async {
    if (_cameraController!.value.isInitialized) {
      try {
        XFile file = await _cameraController!.takePicture();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Photo captured: ${file.path}')),
        );
        // You can display or use the file path to show the image.
      } catch (e) {
        print('Error capturing photo: $e');
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error capturing photo: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme:const IconThemeData(color: Colors.teal),
      ),
      body: isCameraInitialized
          ?  Container(
           width: double.infinity,
            height: double.infinity,
            child: Stack(
                    children: [
            // Camera Preview
            CameraPreview(_cameraController!),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Center(
                child: FloatingActionButton(
                  onPressed: capturePhoto,
                  backgroundColor: Colors.blueAccent,
                  child: Icon(Icons.camera),
                ),
              ),
            ),
                    ],
                  ),
          )
          : Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

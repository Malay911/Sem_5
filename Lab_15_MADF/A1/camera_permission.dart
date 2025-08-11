import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Permission Demo',
      home: CameraPermissionPage(),
    ),
  );
}

class CameraPermissionPage extends StatefulWidget {
  const CameraPermissionPage({super.key});

  @override
  _CameraPermissionPageState createState() => _CameraPermissionPageState();
}

class _CameraPermissionPageState extends State<CameraPermissionPage> {
  String _status = 'Permission not requested yet';

  Future<void> _requestCameraPermission() async {
    PermissionStatus status = await Permission.camera.request();

    setState(() {
      if (status.isGranted) {
        _status = 'Camera permission granted';
      } else if (status.isDenied) {
        _status = 'Camera permission denied';
      } else if (status.isPermanentlyDenied) {
        _status = 'Camera permission permanently denied';
        openAppSettings();
      } else {
        _status = 'Camera permission status: ${status.toString()}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Camera Permission"),
      ),
      body: Center(
        child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  _status,
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                ElevatedButton(
                    onPressed: _requestCameraPermission,
                    child: Text("Request Permission")),
              ],
            )),
      ),
    );
  }
}

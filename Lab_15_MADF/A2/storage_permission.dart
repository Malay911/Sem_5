import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Storage Permission Demo',
      home: StoragePermissionPage(),
    ),
  );
}

class StoragePermissionPage extends StatefulWidget {
  const StoragePermissionPage({super.key});

  @override
  State<StoragePermissionPage> createState() => _StoragePermissionPageState();
}

class _StoragePermissionPageState extends State<StoragePermissionPage> {
  String _status = 'Permission not requested yet';

  Future<void> _requestStoragePermission() async {
    PermissionStatus status;
    if (await Permission.manageExternalStorage.isGranted) {
      status = PermissionStatus.granted;
    } else {
      status = await Permission.manageExternalStorage.request();
    }

    setState(() {
      if (status.isGranted) {
        _status = 'Storage permission granted';
      } else if (status.isDenied) {
        _status = 'Storage permission denied';
      } else if (status.isPermanentlyDenied) {
        _status = 'Storage permission permanently denied';
        openAppSettings();
      } else {
        _status = 'Storage permission status: ${status.toString()}';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Storage Permission"),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                _status,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: _requestStoragePermission,
                child: Text("Request Storage Permission"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

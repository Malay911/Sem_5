import 'utils/import_export.dart';

class NavigateUsingGetMiddleware2 extends StatelessWidget {
  const NavigateUsingGetMiddleware2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigate Using Get Middleware 2"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.back();
          },
          child: const Text("Go Back to Screen 1"),
        ),
      ),
    );
  }
}
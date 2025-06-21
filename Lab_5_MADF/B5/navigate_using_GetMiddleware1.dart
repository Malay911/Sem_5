// WAP to transit using GetMiddleware.
import 'utils/import_export.dart';

void main() {
  runApp(GetMaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    getPages: [
      GetPage(
        name: '/', 
        page: () => const NavigateUsingGetMiddleware1()
      ),
      GetPage(
        name: '/screen2', 
        page: () => const NavigateUsingGetMiddleware2(),
        middlewares: [AuthMiddleware()],
      ),
    ],
  ));
}

class NavigateUsingGetMiddleware1 extends StatelessWidget {
  const NavigateUsingGetMiddleware1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Navigate Using Get Middleware 1"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed('/screen2');
          },
          child: const Text("Go to Screen 2"),
        ),
      ),
    );
  }
}
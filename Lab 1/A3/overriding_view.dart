import 'utils/import_export.dart';

void main() {
  runApp(const MaterialApp(
    home: OverridingView(),
    debugShowCheckedModeBanner: false,
  ));
}

class OverridingView extends StatelessWidget {
  const OverridingView({super.key});

  @override
  Widget build(BuildContext context) {
    final StudentController controller = StudentController();
    final students = controller.getStudents();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Method Overriding Demo'),
      ),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          final student = students[index];
          return Card(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              title: Text(student.getInfo()),
              leading: const Icon(Icons.person),
            ),
          );
        },
      ),
    );
  }
}

import 'utils/import_export.dart';

void main() {
  runApp(const MaterialApp(home: Studentview()));
}

class Studentview extends StatefulWidget {
  const Studentview({super.key});

  @override
  State<Studentview> createState() => _StudentviewState();
}

class _StudentviewState extends State<Studentview> {
  final StudentController studentController = StudentController();

  @override
  Widget build(BuildContext context) {
    StudentModel student = studentController.getStudent();

    return Scaffold(
      appBar: AppBar(
        title: Text("Student Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Name: ${student.name}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            Text(
              'Enrollment: ${student.enrollmentNo}',
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

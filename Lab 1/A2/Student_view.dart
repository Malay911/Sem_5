import 'utils/import_export.dart';

void main() {
  runApp(const MaterialApp(home: StudentView()));
}

class StudentView extends StatefulWidget {
  const StudentView({super.key});

  @override
  State<StudentView> createState() => _StudentViewState();
}

class _StudentViewState extends State<StudentView> {
  StudentController studentController = StudentController();
  ExtendedStudentController extendedStudentController =
      ExtendedStudentController();

  @override
  Widget build(BuildContext context) {
    StudentModel student = studentController.getStudent();
    StudentModel extendedStudent = extendedStudentController.getStudent();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Student Details"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Base Student:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Name: ${student.name}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Enrollment: ${student.enrollmentNo}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Age: ${student.age}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            const Text(
              'Extended Student:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              'Name: ${extendedStudent.name}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Enrollment: ${extendedStudent.enrollmentNo}',
              style: const TextStyle(fontSize: 18),
            ),
            Text(
              'Age: ${extendedStudent.age}',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}

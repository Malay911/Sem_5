import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/Lab_12_MADF/A2/delete_controller.dart';
import 'package:lab/Lab_12_MADF/A2/delete_model.dart';

void main() {
  runApp(MaterialApp(
    home: StudentDeleteApiView(),
  ));
}

class StudentDeleteApiView extends StatelessWidget {
  final StudentDeleteApiController controller =
      Get.put(StudentDeleteApiController());

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Api Delete")),
      body: Obx(() => ListView.builder(
            itemCount: controller.students.length,
            itemBuilder: (context, index) {
              final student = controller.students[index];
              return ListTile(
                title: Text(student.name ?? 'No name'),
                subtitle: Text('Age: ${student.age} | Email: ${student.email}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete),
                  onPressed: () => controller.deleteStudent(student.id!),
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showStudentForm(context),
        child: Icon(Icons.add),
      ),
    );
  }

  void showStudentForm(BuildContext context, {StudentDeleteApiModel? student}) {
    if (student != null) {
      nameController.text = student.name;
      ageController.text = student.age.toString();
      emailController.text = student.email;
    } else {
      nameController.clear();
      ageController.clear();
      emailController.clear();
    }

    Get.defaultDialog(
      title: student == null ? "Add Student" : "Update Student",
      content: Column(
        children: [
          TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name')),
          TextField(
              controller: ageController,
              decoration: InputDecoration(labelText: 'Age'),
              keyboardType: TextInputType.number),
          TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email')),
        ],
      ),
      textConfirm: "Save",
      textCancel: "Cancel",
      onConfirm: () {
        final s = StudentDeleteApiModel(
          id: student?.id,
          name: nameController.text,
          age: int.parse(ageController.text),
          email: emailController.text,
        );
        if (student == null) {
          controller.addStudent(s);
        } else {
          controller.updateStudent(student.id!, s);
        }
        Get.back();
      },
      onCancel: () => Get.back(),
    );
  }
}

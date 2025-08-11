import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lab/Lab_12_MADF/A1/post_put_controller.dart';
import 'package:lab/Lab_12_MADF/A1/post_put_model.dart';
import 'package:lab/Lab_12_MADF/A1/utils/strings.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: StudentPostPutView(),
    ),
  );
}

class StudentPostPutView extends StatelessWidget {
  final StudentPostPutController controller =
      Get.put(StudentPostPutController());

  final nameController = TextEditingController();
  final ageController = TextEditingController();
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(APPBAR_TITLE)),
      body: Obx(() => ListView.builder(
            itemCount: controller.students.length,
            itemBuilder: (_, index) {
              final student = controller.students[index];
              return ListTile(
                title: Text(student.name),
                subtitle: Text("${student.age}, ${student.email}"),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => showStudentForm(student: student),
                    ),
                  ],
                ),
              );
            },
          )),
      floatingActionButton: FloatingActionButton(
        onPressed: () => showStudentForm(),
        child: Icon(Icons.add),
      ),
    );
  }

  void showStudentForm({StudentPostPutModel? student}) {
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
      title: student == null ? BTN_ADD : BTN_UPDATE,
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
        final s = StudentPostPutModel(
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

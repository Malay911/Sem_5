import 'utils/import_export.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  runApp(
    GetMaterialApp(
      home: SQliteDatabaseView(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class SQliteDatabaseView extends StatelessWidget {
  const SQliteDatabaseView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(DatabaseController());

    final nameCtrl = TextEditingController();
    final enrollCtrl = TextEditingController();
    final garde12Ctrl = TextEditingController();
    final diplomaCgpaCtrl = TextEditingController();
    final cgpaCtrl = TextEditingController();
    final emailCtrl = TextEditingController();
    final phoneCtrl = TextEditingController();
    final cityCtrl = TextEditingController();
    RxInt? selectedUnivId = RxInt(0);

    void showAddStudentDialog([SQLiteDatabaseModel? student]) {
      if (student == null) {
        nameCtrl.clear();
        enrollCtrl.clear();
        garde12Ctrl.clear();
        cgpaCtrl.clear();
        diplomaCgpaCtrl.clear();
        emailCtrl.clear();
        phoneCtrl.clear();
        cityCtrl.clear();
        selectedUnivId.value = controller.universities.isNotEmpty
            ? controller.universities.first.id ?? 0
            : 0;
      } else {
        nameCtrl.text = student.name;
        enrollCtrl.text = student.enrollmentNumber;
        garde12Ctrl.text = student.grade12?.toString() ?? '';
        diplomaCgpaCtrl.text = student.diplomaCgpa?.toString() ?? '';
        cgpaCtrl.text = student.currentCgpa.toString();
        emailCtrl.text = student.email;
        phoneCtrl.text = student.phone;
        cityCtrl.text = student.city;
        selectedUnivId.value = student.universityId ?? 0;
      }

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(student == null ? 'Add Student' : 'Update Student'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                    controller: nameCtrl,
                    decoration: const InputDecoration(labelText: 'Name')),
                TextField(
                    controller: enrollCtrl,
                    decoration:
                        const InputDecoration(labelText: 'Enrollment No')),
                TextField(
                    controller: garde12Ctrl,
                    decoration:
                        const InputDecoration(labelText: 'Grade 12 CGPA'),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: diplomaCgpaCtrl,
                    decoration:
                        const InputDecoration(labelText: 'Diploma CGPA'),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: cgpaCtrl,
                    decoration:
                        const InputDecoration(labelText: 'Current CGPA'),
                    keyboardType: TextInputType.number),
                TextField(
                    controller: emailCtrl,
                    decoration: const InputDecoration(labelText: 'Email')),
                TextField(
                    controller: phoneCtrl,
                    decoration: const InputDecoration(labelText: 'Phone')),
                TextField(
                    controller: cityCtrl,
                    decoration: const InputDecoration(labelText: 'City')),
                const SizedBox(height: 10),
                Obx(() => DropdownButton<int>(
                      value: selectedUnivId.value == 0 &&
                              controller.universities.isNotEmpty
                          ? controller.universities.first.id
                          : selectedUnivId.value,
                      items: controller.universities.map((univ) {
                        return DropdownMenuItem<int>(
                          value: univ.id,
                          child: Text(univ.name),
                        );
                      }).toList(),
                      onChanged: (val) {
                        if (val != null) selectedUnivId.value = val;
                      },
                      isExpanded: true,
                      hint: const Text('Select University'),
                    )),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameCtrl.text.isNotEmpty &&
                    enrollCtrl.text.isNotEmpty &&
                    cgpaCtrl.text.isNotEmpty &&
                    selectedUnivId.value != 0) {
                  final studentData = SQLiteDatabaseModel(
                    id: student?.id,
                    name: nameCtrl.text,
                    enrollmentNumber: enrollCtrl.text,
                    grade12: double.tryParse(garde12Ctrl.text),
                    diplomaCgpa: double.tryParse(diplomaCgpaCtrl.text),
                    currentCgpa: double.tryParse(cgpaCtrl.text) ?? 0.0,
                    email: emailCtrl.text,
                    phone: phoneCtrl.text,
                    city: cityCtrl.text,
                    universityId: selectedUnivId.value,
                  );

                  if (student == null) {
                    controller.addStudent(studentData);
                  } else {
                    controller.updateStudent(studentData);
                  }
                  Navigator.pop(ctx);
                }
              },
              child: Text(student == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      );
    }

    void showAddUniversityDialog([University? university]) {
      final univNameCtrl = TextEditingController(text: university?.name ?? '');
      final univCityCtrl = TextEditingController(text: university?.city ?? '');

      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          title:
              Text(university == null ? 'Add University' : 'Update University'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                  controller: univNameCtrl,
                  decoration:
                      const InputDecoration(labelText: 'University Name')),
              TextField(
                  controller: univCityCtrl,
                  decoration: const InputDecoration(labelText: 'City')),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(ctx),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (univNameCtrl.text.isNotEmpty &&
                    univCityCtrl.text.isNotEmpty) {
                  final universityData = University(
                    id: university?.id,
                    name: univNameCtrl.text,
                    city: univCityCtrl.text,
                  );

                  if (university == null) {
                    controller.addUniversity(universityData);
                  } else {
                    controller.updateUniversity(universityData);
                  }
                  Navigator.pop(ctx);
                }
              },
              child: Text(university == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      );
    }

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("CRUD Multiple Tables"),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Universities'),
              Tab(text: 'Students'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Obx(() => ListView.builder(
                  itemCount: controller.universities.length,
                  itemBuilder: (context, index) {
                    final univ = controller.universities[index];
                    return ListTile(
                      title: Text(univ.name),
                      subtitle: Text(univ.city),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => showAddUniversityDialog(univ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                controller.deleteUniversity(univ.id!),
                          ),
                        ],
                      ),
                    );
                  },
                )),
            Obx(() => ListView.builder(
                  itemCount: controller.students.length,
                  itemBuilder: (context, index) {
                    final student = controller.students[index];
                    return ListTile(
                      title: Text(student.name),
                      subtitle: Text(
                          'Enroll: ${student.enrollmentNumber}\nEmail: ${student.email}\nPhone: ${student.phone}\nCity: ${student.city}\nUnivID: ${student.universityId}'),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.blue),
                            onPressed: () => showAddStudentDialog(student),
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () =>
                                controller.deleteStudent(student.id!),
                          ),
                        ],
                      ),
                    );
                  },
                )),
          ],
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton.extended(
              heroTag: 'addUniv',
              onPressed: () => showAddUniversityDialog(),
              icon: const Icon(Icons.school),
              label: const Text('Add University'),
            ),
            const SizedBox(height: 12),
            FloatingActionButton.extended(
              heroTag: 'addStudent',
              onPressed: () => showAddStudentDialog(),
              icon: const Icon(Icons.person_add),
              label: const Text('Add Student'),
            ),
          ],
        ),
      ),
    );
  }
}

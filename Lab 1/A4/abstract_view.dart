import 'utils/import_export.dart';

void main() {
  runApp(const MaterialApp(
    home: AbstractView(),
    debugShowCheckedModeBanner: false,
  ));
}

class AbstractView extends StatelessWidget {
  const AbstractView({super.key});

  @override
  Widget build(BuildContext context) {
    final ShapeController controller = ShapeController();
    final shapes = controller.getShapes();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Abstract Classes Demo'),
        backgroundColor: Colors.grey,
      ),
      body: ListView.builder(
        itemCount: shapes.length,
        padding: const EdgeInsets.all(16),
        itemBuilder: (context, index) {
          final shape = shapes[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    shape.getShapeName(),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Area: ${shape.calculateArea().toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                  Text(
                    'Perimeter: ${shape.calculatePerimeter().toStringAsFixed(2)}',
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'utils/import_export.dart';

void main() {
  runApp(const MaterialApp(
    home: StaticView(),
    debugShowCheckedModeBanner: false,
  ));
}

class StaticView extends StatefulWidget {
  const StaticView({super.key});

  @override
  State<StaticView> createState() => _StaticViewState();
}

class _StaticViewState extends State<StaticView> {
  final CounterController _controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Static Variable Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              setState(() {
                _controller.resetCount();
              });
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Current Count: ${_controller.getCurrentCount()}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.incrementByUser1();
                });
              },
              child: const Text('Increment by User 1'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.incrementByUser2();
                });
              },
              child: const Text('Increment by User 2'),
            ),
          ],
        ),
      ),
    );
  }
}

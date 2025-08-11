import 'package:flutter/material.dart';
import 'package:tap_counter_button/tap_counter_button.dart';
import 'package:lab/Lab_14_MADF/counter_controller.dart';

void main(){
  runApp(MaterialApp(
    title: 'Tap Counter Button',
    home: HomeView(),
  ));
}

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final CounterController _controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MVC + Custom Pub")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Controller Count: ${_controller.count}", style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            TapCounterButton(
              label: "Tap Me",
              backgroundColor: Colors.blue,
              textStyle: const TextStyle(color: Colors.white),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _controller.increment();
                });
              },
              child: const Text("Increment via Controller"),
            ),
          ],
        ),
      ),
    );
  }
}

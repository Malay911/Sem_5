import 'package:lab/Lab_14_MADF/counter_model.dart';

class CounterController {
  final CounterModel _model = CounterModel();

  int get count => _model.count;

  void increment() {
    _model.increment();
  }
}

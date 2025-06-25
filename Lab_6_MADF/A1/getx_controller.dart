import 'utils/import_export.dart';

class CounterController extends GetxController {
  final CounterModel _model = CounterModel();
  
  int get count => _model.count;
  String get message => _model.message;

  void increment() {
    _model.count++;
    _model.message = 'Count updated to: ${_model.count}';
    update();
  }

  void reset() {
    _model.count = 0;
    _model.message = 'Counter reset';
    update();
  }
}
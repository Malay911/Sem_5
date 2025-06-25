// WAP to use Rx Variables with Obx() & Obs.
import 'utils/import_export.dart';

class RxVariableModal {
  RxInt count = 0.obs;
  RxString message = 'Initial Message'.obs;

  void increment() {
    count++;
    message.value = 'Count is now: $count';
  }

  void reset() {
    count.value = 0;
    message.value = 'Count has been reset';
  }
}
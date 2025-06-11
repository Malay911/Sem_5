import 'utils/import_export.dart';

class CounterController {
  final CounterUser user1 = CounterUser("User 1");
  final CounterUser user2 = CounterUser("User 2");

  void incrementByUser1() {
    user1.incrementCounter();
  }

  void incrementByUser2() {
    user2.incrementCounter();
  }

  int getCurrentCount() {
    return Counter.count;
  }

  void resetCount() {
    Counter.reset();
  }
}
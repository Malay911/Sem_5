// 5. WAP to create static Variable & call It from two different classes & observe the result.

//Explaination:
//Counter.count is a static variable which shared across all instances
//Both User1 and User2 increment the same counter
//The count works seamlessly regardless of which user increments it

class Counter {
  static int count = 0;

  static void increment() {
    count++;
  }

  static void reset() {
    count = 0;
  }
}

class CounterUser {
  String name;

  CounterUser(this.name);

  void incrementCounter() {
    Counter.increment();
  }

  int getCount() {
    return Counter.count;
  }
}

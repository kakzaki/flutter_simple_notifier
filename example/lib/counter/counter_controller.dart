import 'package:simple_notifier/simple_notifier.dart';
export 'package:simple_notifier/simple_notifier.dart';

class CounterController {
  static final count = 0.notifier;

  static void increment() {
    count.value++;
  }

  static void reset() {
    count.value = 0;
  }
}

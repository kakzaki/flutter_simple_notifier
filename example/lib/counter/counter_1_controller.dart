import 'package:simple_notifier/simple_notifier.dart';
export 'package:simple_notifier/simple_notifier.dart';

///Counter1Controller will never dispose it's properties
class Counter1Controller {
  static final count = 0.notifier;

  static void increment() {
    count.value++;
  }

  static void reset() {
    count.value = 0;
  }
}

import 'package:simple_notifier/simple_notifier.dart';
export 'package:simple_notifier/simple_notifier.dart';

///Counter3Controller not using static
class Counter3Controller {
  final count = 0.notifier;

  void increment() {
    count.value++;
  }

  void reset() {
    count.value = 0;
  }
}

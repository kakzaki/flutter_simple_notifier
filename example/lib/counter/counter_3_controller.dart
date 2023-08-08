import 'package:flutter/foundation.dart';
import 'package:simple_notifier/simple_notifier.dart';
export 'package:simple_notifier/simple_notifier.dart';

///Counter3Controller not using static
class Counter3Controller {
  late ValueNotifier<int> count;

  void increment() {
    count.value++;
  }

  void reset() {
    count.value = 0;
  }

  void init() {
    count = 0.notifier;
  }

  void dispose() {
    count.dispose();
  }
}

///Global Counter3Controller
final counterCon = Counter3Controller();

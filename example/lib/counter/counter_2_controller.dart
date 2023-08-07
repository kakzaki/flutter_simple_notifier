import 'package:flutter/material.dart';
import 'package:simple_notifier/simple_notifier.dart';
export 'package:simple_notifier/simple_notifier.dart';

///Counter2Controller with init and dispose
class Counter2Controller {
  static late ValueNotifier<int> count;

  static void increment() {
    count.value++;
  }

  static void reset() {
    count.value = 0;
  }

  static void init() {
    count = 0.notifier;
  }

  static void dispose() {
    count.dispose();
  }
}

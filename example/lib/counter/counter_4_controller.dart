import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_notifier/simple_notifier.dart';
export 'package:simple_notifier/simple_notifier.dart';

///Counter4Controller using injectable
@LazySingleton()
class Counter4Controller {
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

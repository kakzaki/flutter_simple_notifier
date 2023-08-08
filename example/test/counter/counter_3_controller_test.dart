import 'package:flutter_test/flutter_test.dart';
import 'package:simple_notifier_example/counter/counter_3_controller.dart';

void main() {
  // Test for Counter3Controller
  test('Test Counter3Controller', () {
    // Test the increment method
    counterCon.increment();
    expect(counterCon.count.value, 1);

    // Test the reset method
    counterCon.reset();
    expect(counterCon.count.value, 0);
  });
}

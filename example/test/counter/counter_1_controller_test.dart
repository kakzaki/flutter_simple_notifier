import 'package:flutter_test/flutter_test.dart';
import 'package:simple_notifier_example/counter/counter_1_controller.dart';

void main() {
  test('increment should increment count', () {
    // Initialize to 0
    expect(Counter1Controller.count.value, equals(0));

    // Increment
    Counter1Controller.increment();

    // Should be incremented
    expect(Counter1Controller.count.value, equals(1));
  });

  test('reset should reset count to 0', () {
    // Initialize to 5
    Counter1Controller.count.value = 5;
    expect(Counter1Controller.count.value, equals(5));

    // Reset
    Counter1Controller.reset();

    // Should be reset to 0
    expect(Counter1Controller.count.value, equals(0));
  });
}

import 'package:flutter_test/flutter_test.dart';
import 'package:simple_notifier_example/counter_controller.dart';

void main() {
  test('increment should increment count', () {
    // Initialize to 0
    expect(CounterController.count.value, equals(0));

    // Increment
    CounterController.increment();

    // Should be incremented
    expect(CounterController.count.value, equals(1));
  });

  test('reset should reset count to 0', () {
    // Initialize to 5
    CounterController.count.value = 5;
    expect(CounterController.count.value, equals(5));

    // Reset
    CounterController.reset();

    // Should be reset to 0
    expect(CounterController.count.value, equals(0));
  });
}

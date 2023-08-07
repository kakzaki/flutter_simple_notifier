import 'package:flutter_test/flutter_test.dart';
import 'package:simple_notifier_example/counter/counter_2_controller.dart';

void main() {
  // Test for Counter2Controller
  test('Test Counter2Controller', () {
    // Initialize the Counter2Controller
    Counter2Controller.init();

    // Test the increment method
    Counter2Controller.increment();
    expect(Counter2Controller.count.value, 1);

    // Test the reset method
    Counter2Controller.reset();
    expect(Counter2Controller.count.value, 0);

    // Dispose the Counter2Controller
    Counter2Controller.dispose();
  });
}

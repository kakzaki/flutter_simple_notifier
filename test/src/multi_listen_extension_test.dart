import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_notifier/simple_notifier.dart';

void main() {
  testWidgets('Test MultiValueNotifierBuilder widget and listen extension',
      (WidgetTester tester) async {
    // Create some mock notifiers for testing
    final notifier1 = ValueNotifier<int>(1);
    final notifier2 = DeepValueNotifier<int>(2);

    // Create a flag to track if the callback was called
    bool callbackCalled = false;

    // Define your onChange callback
    void onChange() {
      callbackCalled = true;
    }

    // Build a minimal widget tree for the test, providing a valid BuildContext
    await tester.pumpWidget(
      MaterialApp(
        home: [notifier1, notifier2].listen(
          builder: (context, child) {
            // Call the onChange callback when the widget is built.
            onChange();
            return Container();
          },
        ),
      ),
    );

    // Change the value in one of the notifiers
    notifier2.value = 42;

    // Wait for the framework to rebuild
    await tester.pump();

    // Verify that the callback was called
    expect(callbackCalled, true);
    expect(notifier1.value, 1);
    expect(notifier2.value, 42);
  });
}

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:simple_notifier/simple_notifier.dart';
import 'package:simple_notifier/src/multi_listen_extension.dart';

void main() {
  testWidgets('Test multiListen', (WidgetTester tester) async {
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
        home: Builder(
          builder: (context) {
            // Use the multiListen extension to listen to changes in notifiers
            [notifier1, notifier2].multiListen(context, onChange);

            // Return a placeholder widget for the test
            return Container();
          },
        ),
      ),
    );

    // Change the value in one of the notifiers
    notifier1.value = 42;

    // Wait for the framework to rebuild
    await tester.pump();

    // Verify that the callback was called
    expect(callbackCalled, true);
  });
}

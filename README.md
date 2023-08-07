## Simplify Value Notifier Usage with `simple_notifier` Package

This is a simple Flutter application that demonstrates the usage of the `simple_notifier` package to simplify the management of state with `ValueNotifier`. With the `simple_notifier` package, you can streamline your code and easily listen to changes in state, making state management in Flutter apps much more straightforward.

[![pub package](https://img.shields.io/pub/v/simple_notifier.svg)](https://pub.dev/packages/simple_notifier)
[![pub package](https://img.shields.io/twitter/follow/kakzaki_id.svg?colorA=1da1f2&colorB=&label=Follow%20on%20Twitter)](https://twitter.com/kakzaki_id)

### Overview

In this example, we create a basic Flutter app that displays a counter value and allows the user to increment and reset the counter using buttons. By utilizing the `simple_notifier` package, we efficiently manage the counter state using `ValueNotifier`, and we use the `ValueListenableBuilder` to listen for changes and update the UI accordingly.

### Prerequisites

Make sure you have Flutter installed and set up on your development environment.

### Setup

1. Create a new Flutter project.
2. Add the `simple_notifier` package to your `pubspec.yaml` file:
   ```yaml
   dependencies:
     flutter:
       sdk: flutter
     simple_notifier: ^1.0.0
   ```
3. Run `flutter pub get` to install the package.

### Code Example


```dart
import 'package:flutter/material.dart';
import 'package:simple_notifier/simple_notifier_base_test.dart';

void main() {
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _counter = 0.notifier;
  
@override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Notifier Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _counter.listen(
                builder: (context, value, child) {
                  return Text(
                    'Counter Value: $value',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _incrementCounter,
                child: const Text('Increment Counter'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _resetCounter,
                child: const Text('Reset Counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
  
  void _incrementCounter() {
    _counter.value++;
  }

  void _resetCounter() {
    _counter.value = 0;
  }
}
```

The `_incrementCounter` and `_resetCounter` functions update the `_counter` value notifier by incrementing or resetting the counter value.

### Conclusion

In this example, we learned how to utilize the `simple_notifier` package to simplify the usage of `ValueNotifier` and manage state more efficiently in Flutter applications. We created a basic Flutter app that displays a counter value and allows users to increment and reset the counter using buttons. By using the `simple_notifier` package, we streamline the state management process, making it easier to manage state changes and update the UI accordingly.
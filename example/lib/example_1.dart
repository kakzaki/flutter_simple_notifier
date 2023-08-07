import 'package:flutter/material.dart';
import 'counter/counter_controller.dart';

class Example1 extends StatelessWidget {
  Example1({super.key});

  final _counter = 0.notifier;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Notifier Example 1'),
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
    );
  }

  void _incrementCounter() {
    _counter.value++;
  }

  void _resetCounter() {
    _counter.value = 0;
  }
}

import 'package:flutter/material.dart';
import 'counter/counter_1_controller.dart';

class Example1 extends StatelessWidget {
  const Example1({super.key});

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
            Counter1Controller.count.listen(
              builder: (context, value, child) {
                return Text(
                  'Counter Value: $value',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            const ElevatedButton(
              onPressed: Counter1Controller.increment,
              child: Text('Increment Counter'),
            ),
            const SizedBox(height: 8),
            const ElevatedButton(
              onPressed: Counter1Controller.reset,
              child: Text('Reset Counter'),
            ),
          ],
        ),
      ),
    );
  }
}

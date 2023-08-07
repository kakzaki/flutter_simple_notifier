import 'package:flutter/material.dart';
import 'counter/counter_3_controller.dart';

class Example3 extends StatelessWidget {
  Example3({super.key});

  final counterCon = Counter3Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Notifier Example 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            counterCon.count.listen(
              builder: (context, value, child) {
                return Text(
                  'Counter Value: $value',
                  style: const TextStyle(fontSize: 24),
                );
              },
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: counterCon.increment,
              child: const Text('Increment Counter'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: counterCon.reset,
              child: const Text('Reset Counter'),
            ),
          ],
        ),
      ),
    );
  }
}

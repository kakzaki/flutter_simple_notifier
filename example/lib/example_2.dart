import 'package:flutter/material.dart';
import 'counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Simple Notifier Example 2'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CounterController.count.listen(
                builder: (context, value, child) {
                  return Text(
                    'Counter Value: $value',
                    style: const TextStyle(fontSize: 24),
                  );
                },
              ),
              const SizedBox(height: 20),
              const ElevatedButton(
                onPressed: CounterController.increment,
                child: Text('Increment Counter'),
              ),
              const SizedBox(height: 8),
              const ElevatedButton(
                onPressed: CounterController.reset,
                child: Text('Reset Counter'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

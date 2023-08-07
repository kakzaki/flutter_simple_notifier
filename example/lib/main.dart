import 'package:flutter/material.dart';
import 'example_1.dart';
import 'example_2.dart';

void main() {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Notifier Example'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => _gotoExample1(context),
              child: const Text('Example 1'),
            ),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () => _gotoExample2(context),
              child: const Text('Example 2'),
            ),
          ],
        ),
      ),
    );
  }

  void _gotoExample1(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => Example1()),
    );
  }

  void _gotoExample2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Example2()),
    );
  }
}

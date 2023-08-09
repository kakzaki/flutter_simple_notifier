import 'package:flutter/material.dart';
import 'counter/counter_1_controller.dart';

class Example0 extends StatefulWidget {
  const Example0({super.key});

  @override
  State<Example0> createState() => _Example0State();
}

class _Example0State extends State<Example0> {
  final _counter = 0.notifier;

  final DeepValueNotifier<List<int>?> _numbers = DeepValueNotifier(null);

  void _fetchNumbers() async {
    await Future.delayed(const Duration(seconds: 3));
    _numbers.value = [];
  }

  @override
  void initState() {
    _fetchNumbers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Notifier Example 0'),
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
            _numbers.observe(
              // ifNull: const CircularProgressIndicator(), //optional
              // ifEmpty: const Text("List is empty"), //optional
              hasData: (values) => Text(
                '$values',
              ),
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
    _numbers.value?.add(_counter.value);
    _numbers.refresh();
  }

  void _resetCounter() {
    _counter.value = 0;
    _numbers.value = [];
    _numbers.refresh();
  }
}

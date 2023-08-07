import 'package:flutter/material.dart';
import 'counter/counter_2_controller.dart';

class Example2 extends StatefulWidget {
  const Example2({super.key});

  @override
  State<Example2> createState() => _Example2State();
}

class _Example2State extends State<Example2> {
  @override
  void initState() {
    Counter2Controller.init();
    super.initState();
  }

  @override
  void dispose() {
    Counter2Controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Notifier Example 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildCountText(),
            const SizedBox(height: 20),
            _buildButtonIncrement(),
            const SizedBox(height: 8),
            _buildButtonReset(),
          ],
        ),
      ),
    );
  }
}

Widget _buildCountText() {
  return Counter2Controller.count.listen(
    builder: (context, value, child) {
      return Text(
        'Counter Value: $value',
        style: const TextStyle(fontSize: 24),
      );
    },
  );
}

Widget _buildButtonIncrement() {
  return const ElevatedButton(
    onPressed: Counter2Controller.increment,
    child: Text('Increment Counter'),
  );
}

Widget _buildButtonReset() {
  return const ElevatedButton(
    onPressed: Counter2Controller.reset,
    child: Text('Reset Counter'),
  );
}

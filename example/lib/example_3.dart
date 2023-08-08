import 'package:flutter/material.dart';
import 'counter/counter_3_controller.dart';

class Example3 extends StatefulWidget {
  const Example3({super.key});

  @override
  State<Example3> createState() => _Example3State();
}

class _Example3State extends State<Example3> {
  @override
  void initState() {
    counterCon.init();
    super.initState();
  }

  @override
  void dispose() {
    counterCon.dispose();
    super.dispose();
  }

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
  return counterCon.count.listen(
    builder: (context, value, child) {
      return Text(
        'Counter Value: $value',
        style: const TextStyle(fontSize: 24),
      );
    },
  );
}

Widget _buildButtonIncrement() {
  return ElevatedButton(
    onPressed: counterCon.increment,
    child: const Text('Increment Counter'),
  );
}

Widget _buildButtonReset() {
  return ElevatedButton(
    onPressed: counterCon.reset,
    child: const Text('Reset Counter'),
  );
}

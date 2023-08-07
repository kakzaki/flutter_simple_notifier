import 'package:flutter/material.dart';
import 'package:simple_notifier_example/injector.dart';
import 'counter/counter_4_controller.dart';

class ExampleDI extends StatefulWidget {
  const ExampleDI({super.key});

  @override
  State<ExampleDI> createState() => _ExampleDIState();
}

class _ExampleDIState extends State<ExampleDI> {
  final counterCon = Counter4Controller();

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
        title: const Text('Simple Notifier Example DI'),
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
  final counterCon = Counter4Controller();
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
  final counterCon = Counter4Controller();
  return ElevatedButton(
    onPressed: counterCon.increment,
    child: const Text('Increment Counter'),
  );
}

Widget _buildButtonReset() {
  final counterCon = Counter4Controller();
  return ElevatedButton(
    onPressed: counterCon.reset,
    child: const Text('Reset Counter'),
  );
}

import 'package:flutter/material.dart';

/// ValueListenableBuilder extension
extension ValueNotifierBuilderExtension<T> on ValueNotifier<T> {
  Widget listen({
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
  }) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: builder,
    );
  }
}

/// ValueNotifier extension on all types
extension ValueNotifierExtension<T> on T {
  ValueNotifier<T> get notifier {
    return ValueNotifier<T>(this);
  }
}

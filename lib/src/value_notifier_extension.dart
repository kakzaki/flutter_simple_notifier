import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:simple_notifier/src/data_checker_widget.dart';

/// Extension for adding convenient methods to [ValueNotifier] instances.
extension ValueNotifierBuilderExtension<T> on ValueNotifier<T> {
  /// Creates a [ValueListenableBuilder] with the provided [builder] function.
  ///
  /// [builder] is a callback that takes a [BuildContext], the current [value],
  /// and an optional [child] widget and returns a widget to build.
  ///
  /// Example usage:
  /// ```dart
  /// ValueNotifier<int> myValueNotifier = ValueNotifier<int>(42);
  ///
  /// Widget myWidget = myValueNotifier.listen(builder: (context, value, child) {
  ///   return Text('Value: $value');
  /// });
  /// ```
  Widget listen({
    required Widget Function(BuildContext context, T value, Widget? child)
        builder,
  }) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: builder,
    );
  }

  /// Creates a [ValueListenableBuilder] that observes the [ValueNotifier] and handles different states.
  ///
  /// [ifNull] is the widget to display when the value is null.
  /// [ifEmpty] is the widget to display when the value is empty (e.g., for strings).
  /// [hasData] is a callback that takes data and returns a widget when the value has data.
  ///
  /// Example usage:
  /// ```dart
  /// ValueNotifier<String?> myValueNotifier = ValueNotifier<String?>(null);
  ///
  /// Widget myWidget = myValueNotifier.observe(
  ///   ifNull: Text('Value is null'),
  ///   ifEmpty: Text('Value is empty'),
  ///   hasData: (data) => Text('Value: $data'),
  /// );
  /// ```
  Widget observe({
    Widget? ifNull,
    Widget? ifEmpty,
    Widget? ifError,
    required Widget Function(dynamic data) hasData,
  }) {
    return ValueListenableBuilder<T>(
      valueListenable: this,
      builder: (context, value, Widget? child) {
        return DataCheckerWidget(
          data: value,
          ifNull: ifNull,
          ifEmpty: ifEmpty,
          ifError: ifError,
          hasData: hasData,
        );
      },
    );
  }
}

/// Extension for creating a [ValueNotifier] from a value directly.
extension ValueNotifierExtension<T> on T {
  /// Creates a [ValueNotifier] instance with the current value.
  ///
  /// Example usage:
  /// ```dart
  /// int initialValue = 42;
  /// ValueNotifier<int> myValueNotifier = initialValue.notifier;
  /// ```
  ValueNotifier<T> get notifier {
    return ValueNotifier<T>(this);
  }
}

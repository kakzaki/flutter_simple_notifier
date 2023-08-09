import 'package:flutter/material.dart';

/// `DeepValueNotifier` is a custom `ValueNotifier` class with content-based equality checks.
class DeepValueNotifier<T> extends ValueNotifier<T> {
  /// Constructs a `DeepValueNotifier` with an initial `value`.
  DeepValueNotifier(T value) : super(value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is DeepValueNotifier<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  /// Adds a method to force a refresh by notifying listeners.
  void refresh() {
    notifyListeners();
  }
}

/// Extension for creating a `DeepValueNotifier` from a value directly.
extension DeepValueNotifierExtension<T> on T {
  /// Creates a `DeepValueNotifier` instance with the current value.
  DeepValueNotifier<T> get deepNotifier {
    return DeepValueNotifier<T>(this);
  }
}

/// Extension for adding convenient methods to `DeepValueNotifier` instances.
extension DeepValueListenableBuilder<T> on DeepValueNotifier<T> {
  /// Creates a `ValueListenableBuilder` with the provided `builder` function.
  ///
  /// [builder] is a callback that takes a `BuildContext`, the current `value`,
  /// and an optional `child` widget and returns a widget to build.
  ///
  /// Example usage:
  /// ```dart
  /// DeepValueNotifier<int> myValueNotifier = 42.deepNotifier;
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
}

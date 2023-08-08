import 'package:flutter/material.dart';

///DeepValueNotifier is Custom ValueNotifier class with content-based equality checks:
class DeepValueNotifier<T> extends ValueNotifier<T> {
  DeepValueNotifier(T value) : super(value);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;

    return other is DeepValueNotifier<T> && other.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  // Add a method to force refresh
  void refresh() {
    notifyListeners();
  }
}

/// DeepValueNotifier extension on all types
extension DeepValueNotifierExtension<T> on T {
  DeepValueNotifier<T> get deepNotifier {
    return DeepValueNotifier<T>(this);
  }
}

/// DeepValueListenableBuilder extension
extension DeepValueListenableBuilder<T> on DeepValueNotifier<T> {
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

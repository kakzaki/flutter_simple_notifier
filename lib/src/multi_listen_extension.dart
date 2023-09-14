import 'package:flutter/material.dart';

/// A callback function type used to handle changes when multiple notifiers change.
typedef MultiListenerCallback = void Function();

/// A class that allows you to listen to changes in multiple `ValueNotifier` and `DeepValueNotifier` instances.
class MultiValueNotifier<T> {
  final List<ValueNotifier<T>> valueNotifiers;
  final MultiListenerCallback onChange;

  /// Constructs a `MultiValueNotifier` with the specified `valueNotifiers`, `deepValueNotifiers`, and an `onChange` callback.
  MultiValueNotifier({
    required this.valueNotifiers,
    required this.onChange,
  }) {
    _initListeners();
  }

  /// Initializes listeners for all registered notifiers.
  void _initListeners() {
    for (final notifier in valueNotifiers) {
      notifier.addListener(_handleChange);
    }
  }

  /// Handles changes in any of the registered notifiers by invoking the `onChange` callback.
  void _handleChange() {
    onChange();
  }

  /// Disposes of listeners for all registered notifiers.
  void dispose() {
    for (final notifier in valueNotifiers) {
      notifier.removeListener(_handleChange);
    }
  }
}

/// An extension for a list of `ValueNotifier` instances to enable listening to changes in multiple notifiers.
extension MultiListenExtension<T> on List<ValueNotifier<T>> {
  /// Listens to changes in multiple `ValueNotifier` instances and triggers the `onChange` callback when any of them changes.
  ///
  /// The [context] parameter is required for Flutter's context-aware features but is not used in this extension.
  void multiListen(BuildContext context, MultiListenerCallback onChange) {
    MultiValueNotifier<T>(
      valueNotifiers: this,
      onChange: onChange,
    );
  }
}

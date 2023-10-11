import 'package:flutter/material.dart';

/// A widget that combines and listens to a list of [ValueNotifier] objects and rebuilds when any of them change.
class MultiValueNotifierBuilder extends StatelessWidget {
  final List<ValueNotifier>
      listValueListenable; // List of ValueNotifier objects to listen to.

  /// The builder function for creating the widget based on the combined values of the [ValueNotifier] objects.
  final Widget Function(BuildContext context, List values, Widget? child)
      builder;

  /// Constructs a [MultiValueNotifierBuilder] widget.
  ///
  /// [listValueListenable]: A non-empty list of [ValueNotifier] objects to listen to.
  /// [builder]: The function used to build the widget with the combined values.
  const MultiValueNotifierBuilder({
    Key? key,
    required this.listValueListenable,
    required this.builder,
  })  : assert(listValueListenable.length !=
            0), // Ensure that the list of ValueNotifiers is not empty.
        super(key: key);

  @override
  Widget build(BuildContext context) {
    // Create an AnimatedBuilder that listens to the merged Listenable of ValueNotifiers.
    return AnimatedBuilder(
      animation: Listenable.merge(listValueListenable),
      builder: (context, child) {
        // Create a list of values by extracting the current values from each ValueNotifier in the list.
        final list = listValueListenable.map((listenable) => listenable.value);
        // Call the builder function with the combined list of values and the child widget.
        return builder(context, List.unmodifiable(list), child);
      },
    );
  }
}

/// Extension method that simplifies the use of [MultiValueNotifierBuilder] on a list of [ValueNotifier] objects.
extension MultiListenExtension<T> on List<ValueNotifier<T>> {
  /// Creates a [MultiValueNotifierBuilder] using this list of [ValueNotifier] objects.
  ///
  /// [builder]: The function used to build the widget with the combined values.
  Widget listen({
    required Widget Function(BuildContext context, List values, Widget? child)
        builder,
  }) {
    // Create and return a [MultiValueNotifierBuilder] with the list of ValueNotifiers and the provided builder function.
    return MultiValueNotifierBuilder(
      listValueListenable: this,
      builder: builder,
    );
  }
}

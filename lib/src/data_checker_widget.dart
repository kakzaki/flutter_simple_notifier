import 'dart:developer';

import 'package:flutter/material.dart';

/// A widget that handles different states of data and returns appropriate widgets.
class DataCheckerWidget extends StatelessWidget {
  /// The data to be checked.
  final dynamic data;

  /// Widget to display when the data is null.
  final Widget? ifNull;

  /// Widget to display when the data is empty (for iterables).
  final Widget? ifEmpty;

  /// Widget to display when error.
  final Widget? ifError;

  /// Callback that returns a widget when the data is present.
  final Widget Function(dynamic data) hasData;

  /// Constructs a [DataCheckerWidget].
  ///
  /// [data] is the data to be checked.
  /// [ifNull] is the widget to display when the data is null.
  /// [ifEmpty] is the widget to display when the data is empty (for iterables).
  /// [ifError] is the widget to display when the data is error.
  /// [hasData] is a callback that returns a widget when the data is present.
  const DataCheckerWidget({
    super.key,
    required this.data,
    this.ifNull,
    this.ifEmpty,
    this.ifError,
    required this.hasData,
  });

  @override
  Widget build(BuildContext context) {
    try {
      if (data == null) {
        return ifNull ??
            const Center(
              child: CircularProgressIndicator(),
            );
      } else if (data is Iterable && data.isEmpty) {
        return ifEmpty ?? const SizedBox.shrink();
      } else {
        return hasData(data);
      }
    } catch (e) {
      log("$e", name: "data checker widget");
      return ifError ?? const SizedBox.shrink();
    }
  }
}

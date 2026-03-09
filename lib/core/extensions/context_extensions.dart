import 'package:flutter/material.dart';

/// Convenience extensions on [BuildContext] to reduce boilerplate.
///
/// Instead of `Theme.of(context).colorScheme.primary`, you can write
/// `context.colorScheme.primary`.
extension ContextExtensions on BuildContext {
  /// Quick access to the current [ThemeData].
  ThemeData get theme => Theme.of(this);

  /// Quick access to the current [ColorScheme].
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Quick access to the current [TextTheme].
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Quick access to the current [MediaQueryData].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Screen width in logical pixels.
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Screen height in logical pixels.
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Whether the keyboard is currently visible.
  bool get isKeyboardVisible => MediaQuery.of(this).viewInsets.bottom > 0;
}

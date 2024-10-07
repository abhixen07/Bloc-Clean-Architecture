import 'package:another_flushbar/flushbar.dart';
import 'package:another_flushbar/flushbar_route.dart';
import 'package:flutter/material.dart';

/// A helper class for displaying custom `Flushbar` messages.
/// `Flushbar` is a customizable snackbar-like widget that can display error or success messages.
class FlushBarHelper {
  /// Displays a flushbar with an error message.
  ///
  /// The flushbar will appear at the top of the screen with a red background
  /// and an error icon.
  static void flushBarErrorMessage(String message, BuildContext context) {
    _showFlushbar(
      message: message,
      context: context,
      backgroundColor: Colors.red,
      icon: const Icon(
        Icons.error,
        size: 24,
        color: Colors.white,
      ),
    );
  }

  /// Displays a flushbar with a success message.
  ///
  /// The flushbar will appear at the top of the screen with a green background
  /// and a success icon.
  static void flushBarSuccessMessage(String message, BuildContext context) {
    _showFlushbar(
      message: message,
      context: context,
      backgroundColor: Colors.green,
      icon: const Icon(
        Icons.check_circle,
        size: 24,
        color: Colors.white,
      ),
    );
  }

  /// Private helper method to display a `Flushbar` with customizable content.
  ///
  /// This method is used internally to reduce code duplication for error and success messages.
  static void _showFlushbar({
    required String message,
    required BuildContext context,
    required Color backgroundColor,
    required Icon icon,
  }) {
    showFlushbar(
      context: context,
      flushbar: Flushbar(
        // Animations for smooth transitions
        forwardAnimationCurve: Curves.decelerate,
        reverseAnimationCurve: Curves.easeInOut,

        // Positioning flushbar slightly below the top for better visibility
        positionOffset: 20,

        // Icon displayed on the left side of the flushbar
        icon: icon,

        // Styling the flushbar with padding and margin for a neat layout
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: const EdgeInsets.all(15),

        // The message text to be shown
        message: message,

        // Styling the background color and text properties
        backgroundColor: backgroundColor,

        // Automatically close after 3 seconds
        duration: const Duration(seconds: 3),

        // Rounded corners for a polished look
        borderRadius: BorderRadius.circular(20),

        // Flushbar position at the top of the screen
        flushbarPosition: FlushbarPosition.TOP,
      )..show(context),
    );
  }
}

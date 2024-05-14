import 'package:flutter/material.dart';

class ASnackBar {
  static snack(String message, {String? actionText, Function? action}) {
    bool hasAction = (actionText != null && action != null);
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      action: hasAction
          ? SnackBarAction(
              label: actionText,
              textColor: Colors.orange,
              onPressed: () => action,
            )
          : null,
    );
  }

  static show(GlobalKey<ScaffoldState> scaffold, String message,
      {String? actionText, Function? action}) {
    // scaffold.currentState.hideCurrentSnackBar();
    // scaffold.currentState.showSnackBar(
    // ASnackBar.snack(message, actionText: actionText, action: action));
  }
}

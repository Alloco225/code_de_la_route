import 'package:flutter/material.dart';

import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

void showSnackbarError(String message, {required BuildContext context}) {
  showSnackbar(context: context, message: message, type: SnackbarType.error);
}

void showSnackbarInfo(String message, {required BuildContext context}) {
  showSnackbar(context: context, message: message, type: SnackbarType.info);
}

void showSnackbarSuccess(String message, {required BuildContext context}) {
  showSnackbar(context: context, message: message, type: SnackbarType.success);
}

void showSnackbar(
    {required BuildContext context,
    required String message,
    SnackbarType type = SnackbarType.error}) {
  var widget = CustomSnackBar.error(message: message);
  switch (type) {
    case SnackbarType.success:
      widget = CustomSnackBar.success(message: message);
      break;
    case SnackbarType.error:
      widget = CustomSnackBar.error(message: message);
      break;
    case SnackbarType.info:
      widget = CustomSnackBar.info(message: message);
      break;
  }
  showTopSnackBar(Overlay.of(context), widget);
}

enum SnackbarType { error, success, info }

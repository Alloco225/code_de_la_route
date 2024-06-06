import 'package:codedelaroute/app/views/widgets/badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

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

void showSnackbarAchievement({
  required BuildContext context,
  String? id,
  String? message,
}) {
  Widget widget = CustomSnackBar.success(
    message: "Asphalt Apprentice Unlocked",
    backgroundColor: Colors.red.shade300,
    iconRotationAngle: 25,
    iconPositionLeft: -20,
    iconPositionTop: -10,
    icon: const SizedBox(
      height: 100,
      width: 100,
      child: BadgeWidget(
        id: "red",
        icon: Ionicons.egg,
      ),
    ),
  );
  widget = CustomSnackBar.success(
    message: "Asphalt Apprentice Unlocked",
    backgroundColor: Colors.purple.shade300,
    iconRotationAngle: 25,
    iconPositionLeft: -20,
    iconPositionTop: -10,
    icon: const SizedBox(
      height: 100,
      width: 100,
      child: BadgeWidget(
        id: "purple",
        icon: Ionicons.planet,
      ),
    ),
  );

  showTopSnackBar(Overlay.of(context), widget);
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

import 'package:codedelaroute/app/views/widgets/badge_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
  String? title,
  required String badge_id,
  required String badge_icon,
}) {
  Widget widget = CustomSnackBar.success(
    message: "${'new_achievement'.tr}\n${'$title'.tr}",
    textAlign: TextAlign.left,
    backgroundColor: colorIndex[badge_id] ?? Colors.blue.shade300,
    iconRotationAngle: 25,
    iconPositionLeft: -10,
    iconPositionTop: -5,
    icon: SizedBox(
      height: 100,
      width: 100,
      child: BadgeWidget(
        id: badge_id,
        iconString: badge_icon,
      ),
    ),
  );

  showTopSnackBar(
    Overlay.of(context), widget,
    // displayDuration: const Duration(minutes: 5)
  );
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

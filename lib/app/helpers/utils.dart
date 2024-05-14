import 'package:flutter/material.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

Color percentageColor(percentage) {
  if (percentage > 1) {
    percentage /= 100;
  }
  if (percentage <= .3) return Colors.red[500]!;
  if (percentage <= .5) return Colors.orange[800]!;
  if (percentage <= .8) return Colors.yellow[800]!;
  return Colors.blue[500]!;
}

openModalBottomSheet(view, {required context}) {
  showMaterialModalBottomSheet(
    expand: false,
    enableDrag: false,
    isDismissible: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => view,
  );
}

openSettingsModal(view, {required context}) {
  showMaterialModalBottomSheet(
    expand: false,
    enableDrag: false,
    isDismissible: true,
    context: context,
    backgroundColor: Colors.transparent,
    builder: (context) => view,
  );
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class AppBarWidget extends StatelessWidget {
  final String title;
  final bool hasBackButton;
  const AppBarWidget({
    super.key,
    required this.title,
    this.hasBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.white,
          fontSize: 30,
        ),
      ),
      leading: hasBackButton
          ? IconButton(
              icon: const Icon(Ionicons.chevron_back),
              onPressed: () => Get.back(),
            )
          : null,
    );
  }
}

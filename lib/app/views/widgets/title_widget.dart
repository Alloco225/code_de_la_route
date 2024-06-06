import 'package:codedelaroute/app/views/widgets/app_bar_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class TitleWidget extends StatelessWidget {
  final String title;
  final bool hasBackButton;
  final double paddingTop;
  final double paddingBottom;
  final double gap;
  const TitleWidget({
    super.key,
    required this.title,
    this.hasBackButton = false,
    this.paddingTop = 50.0,
    this.paddingBottom = 40.0,
    this.gap = 10.0,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, paddingTop, 0, paddingBottom),
      child: Column(
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              color: Colors.white,
              fontSize: 30,
            ),
          ),
           SizedBox(height: gap),
          InkWell(
            onTap: () => Get.back(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Icon(
                  Ionicons.chevron_back,
                  color: Colors.white.withOpacity(.8),
                ),
                Text(
                  'back'.tr,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Colors.white.withOpacity(.8),
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

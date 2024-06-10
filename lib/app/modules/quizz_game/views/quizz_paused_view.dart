import 'package:codedelaroute/app/views/widgets/fancy_button_widget.dart';
import 'package:codedelaroute/app/views/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

class QuizzPausedView extends StatelessWidget {
  final Function() onResume;
  final Function() onQuit;
  final VoidCallback? onClose;

  const QuizzPausedView(
      {super.key, required this.onResume, required this.onQuit, this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black.withOpacity(.8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                // color: Colors.grey.withOpacity(.1),
                borderRadius: BorderRadius.circular(8)),
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TitleWidget(
                  title: 'pause'.tr,
                  hasBackButton: false,
                ),
                const SizedBox(height: 20),
                IconButton(
                  onPressed: onResume,
                  icon: const Icon(
                    Icons.pause_circle_outline,
                    size: 80,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FancyButtonWidget(
                      onTap: onResume,
                      color: 'blue',
                      icon: Ionicons.play_outline,
                      title: 'continue'.tr.toUpperCase(),
                    ),
                    const SizedBox(width: 20),
                    FancyButtonWidget(
                      color: 'red',
                      onTap: onQuit,
                      onLongPress: onClose,
                      icon: Ionicons.trash_outline,
                      title: 'giveup'.tr.toUpperCase(),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

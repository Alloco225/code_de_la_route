import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../../data/services/firestore_service.dart';
import '../../../views/widgets/container_widget.dart';
import '../controllers/profile_controller.dart';

class ProfileStatsView extends StatelessWidget {
  const ProfileStatsView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ProfileController>();

    return ContainerWidget(
      child: Obx(
        () => Row(
          children: [
            Expanded(
                child: _buildStatItem(
              "signs".tr,
              current: controller.learnedSignCount,
              total: controller.totalSignCount,
            )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: _buildStatItem(
              "quizzes".tr,
              current: controller.acedQuizzCount,
              total: controller.totalQuizzCount,
            )),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: _buildStatItem(
                "avg".tr,
                total: 20,
                current: controller.avgScore.toStringAsFixed(2),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatItem(String title, {dynamic current, dynamic total}) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 21),
        ),
        if (current != null && total != null)
          Text(
            "$current/$total",
            style: const TextStyle(fontSize: 20),
          ),
      ],
    );
  }
}

import 'package:codedelaroute/app/modules/panneaux/views/panneau_info_slider_view.dart';
import 'package:codedelaroute/app/views/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../data/models/sign_model.dart';
import '../../../helpers/utils.dart';
import '../../../views/widgets/container_widget.dart';
import '../controllers/panneaux_controller.dart';

class PanneauxView extends GetView<PanneauxController> {
  const PanneauxView({super.key});

  @override
  Widget build(BuildContext context) {
    showSignDetails(Sign sign, context) {
      // Open bottom drawer
      // openModalBottomSheet(PanneauDetailsModalView(sign: sign), context: context);
      controller.showSign(sign.id);

      openModalBottomSheet(
        PanneauInfoSliderModalView(signId: sign.id),
        context: context,
      );
    }

    return Scaffold(
        // Ressource attribution : https://www.vecteezy.com/members/seetwo
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      // child: obx,
      child: Column(
        children: [
          Obx(
            () => TitleWidget(
              title:
                  // "Panneaux ${controller.categoryName}"
                  controller.categoryName == null
                      ? "all_signs".tr
                      : "all_signs".trParams(
                          {'category': controller.categoryName ?? ''}),
            ),
          ),
          Expanded(
              child: Obx(
            () => controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView(children: [
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      axisDirection: AxisDirection.down,
                      children: controller.signs
                          .map((element) => StaggeredGridTile.fit(
                                crossAxisCellCount: 1,
                                child: InkWell(
                                  onTap: () =>
                                      showSignDetails(element, context),
                                  child: ContainerWidget(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        height: 120,
                                        child: Image.asset(
                                          element.imageUrl,
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        element.nameKey.tr ?? '--',
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.w400,
                                            color: Colors.white,
                                            fontSize: 20),
                                      )
                                    ],
                                  )),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 50,
                    )
                  ]),
          )),
        ],
      ),
    ));
  }
}

import 'package:codedelaroute/app/modules/panneaux/views/panneau_details_modal_view.dart';
import 'package:codedelaroute/app/modules/panneaux/views/panneau_info_slider_view.dart';
import 'package:codedelaroute/app/views/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import 'package:get/get.dart';

import '../../../data/models/sign_model.dart';
import '../../../helpers/utils.dart';
import '../../../views/widgets/back_nav_button.dart';
import '../controllers/panneaux_controller.dart';

class PanneauxView extends GetView<PanneauxController> {
  const PanneauxView({super.key});

  @override
  Widget build(BuildContext context) {
    showSignDetails(Sign sign) {
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
              title: (controller.categoryName == null
                  ? "all_signs".tr
                  : "all_signs"
                      .trParams({'category': controller.categoryName ?? ''})),
            ),
          ),
          Obx(() => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: ListView(children: [
                    StaggeredGrid.count(
                      crossAxisCount: 2,
                      mainAxisSpacing: 15,
                      crossAxisSpacing: 15,
                      axisDirection: AxisDirection.down,
                      children: controller.signs
                          .map((element) => StaggeredGridTile.fit(
                                crossAxisCellCount: 1,
                                child: InkWell(
                                  onTap: () => showSignDetails(element),
                                  child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blueGrey.shade800,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: Colors.white,
                                          )),
                                      padding: const EdgeInsets.all(10),
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
                                            element.name ?? '--',
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
                  ]),
                )),
          const BackNavButton(),
        ],
      ),
    ));
  }
}

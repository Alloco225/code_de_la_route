import 'package:auto_size_text/auto_size_text.dart';
import 'package:codedelaroute/app/data/extensions.dart';
import 'package:codedelaroute/app/modules/panneaux/controllers/panneaux_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class PanneauInfoSliderModalView extends GetView<PanneauxController> {
  final String? signId;
  const PanneauInfoSliderModalView({super.key, this.signId});

  // controller.showSign(sign.id);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * .5,
          maxHeight: MediaQuery.of(context).size.height * .5 +
              (controller.sign.description?.length ?? 0) * .66 +
              (controller.sign.name?.length ?? 0) * .3,
        ),
        child: PageView.builder(
          controller: controller.sliderController,
          onPageChanged: controller.updateSignIndex,
          scrollDirection: Axis.horizontal,
          itemCount: controller.signs.length,
          itemBuilder: (ctx, i) => Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade700,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: AutoSizeText(
                          // controller.sign.id!.tr.toCapitalized(),
                          controller.sign.nameKey.tr.toCapitalized(),
                          // controller.sign.name!,

                          textAlign: TextAlign.center,
                          maxLines: 2,
                          style: const TextStyle(
                              height: 1.2,
                              fontSize: 27,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Image.asset(
                        controller.sign.imageUrl,
                        width: 150,
                        height: 150,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Expanded(
                        child: Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(
                              minHeight:
                                  MediaQuery.of(context).size.height * .2),
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.shade800,
                              borderRadius: BorderRadius.circular(4)),
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 5),
                          child: AutoSizeText(
                            controller.sign.descriptionKey.tr ?? '',
                            maxLines: 4,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

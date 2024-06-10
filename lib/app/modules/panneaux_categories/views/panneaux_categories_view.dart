import 'package:codedelaroute/app/data/extensions.dart';
import 'package:codedelaroute/app/data/models/sign_category_model.dart';
import 'package:codedelaroute/app/views/widgets/app_bar_widget.dart';
import 'package:codedelaroute/app/views/widgets/loading_widget.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../views/widgets/back_nav_button.dart';
import '../../../views/widgets/container_widget.dart';
import '../../../views/widgets/title_widget.dart';
import '../controllers/panneaux_categories_controller.dart';

class PanneauxCategoriesView extends GetView<PanneauxCategoriesController> {
  const PanneauxCategoriesView({super.key});

  void gotoSignsList(SignCategory category) {
    Get.toNamed(Routes.PANNEAUX,
        arguments: {"categoryId": category.id, "categoryName": category.name});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Ressource attribution : https://www.vecteezy.com/members/seetwo
        // appBar: PreferredSize(
        //   preferredSize: const Size.fromHeight(kToolbarHeight * 2),
        //   child: Padding(
        //     padding: const EdgeInsets.only(top: 50),
        //     child: AppBarWidget(
        //       title: "title_signs".tr,
        //     ),
        //   ),
        // ),
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Column(
        children: [
          TitleWidget(
            title: "title_signs".tr,
          ),
          Obx(
            () => Expanded(
              child: controller.isLoading
                  ? const LoadingWidget()
                  : GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      children: controller.categories
                          .map((element) => _buildCategoryGridItem(element))
                          .toList(),
                    ),
            ),
          ),
          // const BackNavButton(),
        ],
      ),
    ));
  }


  Widget _buildCategoryGridItem(SignCategory element) {
    return InkWell(
      onTap: () => gotoSignsList(element),
      child: ContainerWidget(
          child: Column(
        children: [
          Expanded(
            child: Image.asset(element.image!),
          ),
          const SizedBox(
            height: 10,
          ),
          Text((element.id ?? '').tr.toCapitalized(),
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  fontSize: 23)),
        ],
      )),
    );
  }
}

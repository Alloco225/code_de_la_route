import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../views/widgets/form_container_widget.dart';
import '../controllers/login_controller.dart';

class LoginModalContentView extends GetView<LoginController> {
  LoginModalContentView({super.key});
  final authController = AuthController();

  @override
  Widget build(BuildContext context) {
    signIn(context) async {
      await controller.signIn(context);
    }

    return Obx(
      () => authController.isAuth
          ? const Text("Already Signed In")
          : Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "login".tr.toUpperCase(),
                    style: const TextStyle(
                        fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  FormContainerWidget(
                    controller: controller.emailController,
                    hintText: "email".tr,
                    isPasswordField: false,
                    onFieldSubmitted: (_) =>
                        controller.passwordNode.requestFocus(),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  FormContainerWidget(
                    controller: controller.passwordController,
                    hintText: "password".tr,
                    isPasswordField: true,
                    onFieldSubmitted: (_) => signIn(context),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  GestureDetector(
                    onTap: () => signIn(context),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.orange.shade400,
                        border: Border.all(
                          width: 3,
                          color: Colors.orange.shade700,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: controller.isSigning
                            ? const CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "login".tr.toUpperCase(),
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "or".tr,
                    style: const TextStyle(fontSize: 22),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.signInWithGoogle(context);
                    },
                    child: Container(
                      width: double.infinity,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Ionicons.logo_google,
                              color: Colors.white,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Text(
                              "login_with_google".tr.toUpperCase(),
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
    );
  }
}

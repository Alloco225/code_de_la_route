import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../views/widgets/form_container_widget.dart';
import '../controllers/register_controller.dart';

class RegisterModalContentView extends GetView<RegisterController> {
  BuildContext parentContext;
   RegisterModalContentView({super.key, required this.parentContext, });
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            "Sign Up",
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 30,
          ),
          FormContainerWidget(
            controller: controller.usernameController,
            focusNode: controller.usernameNode,
            hintText: "Username",
             onFieldSubmitted: (_) =>
                          controller.emailNode.requestFocus(),
            isPasswordField: false,
          ),
          const SizedBox(
            height: 10,
          ),
          FormContainerWidget(
            controller: controller.emailController,
            focusNode: controller.emailNode,
            hintText: "Email",
            isPasswordField: false,
             onFieldSubmitted: (_) => controller.passwordNode.requestFocus()
          ),
          const SizedBox(
            height: 10,
          ),
          FormContainerWidget(
            focusNode: controller.passwordNode,
            controller: controller.passwordController,
            hintText: "Password",
            isPasswordField: true,

                    onFieldSubmitted: (_) => controller.signUp(context),
          ),
          const SizedBox(
            height: 30,
          ),
          GestureDetector(
            onTap: () {
              controller.signUp(context);
            },
            child: Container(
              width: double.infinity,
              height: 45,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                  child: controller.isSigningUp
                      ? const CircularProgressIndicator(
                          color: Colors.white,
                        )
                      : const Text(
                          "Sign Up",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
            ),
          ),
        ],
      ),
    );
  }
}

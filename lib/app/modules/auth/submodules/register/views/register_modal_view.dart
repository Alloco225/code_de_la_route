import 'package:codedelaroute/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../views/widgets/form_container_widget.dart';
import '../controllers/register_controller.dart';

class RegisterModalView extends GetView<RegisterController> {
  const RegisterModalView({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height * .5,
        maxHeight: MediaQuery.of(context).size.height * .6,
      ),
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.blueGrey.shade800,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: Colors.white,
        ),
      ),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              hintText: "Username",
              isPasswordField: false,
            ),
            const SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: controller.emailController,
              hintText: "Email",
              isPasswordField: false,
            ),
            const SizedBox(
              height: 10,
            ),
            FormContainerWidget(
              controller: controller.passwordController,
              hintText: "Password",
              isPasswordField: true,
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
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          )),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?"),
                const SizedBox(
                  width: 5,
                ),
                GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.LOGIN);
                    },
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}

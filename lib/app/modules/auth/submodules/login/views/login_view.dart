import 'package:code_de_la_route/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';

import '../../../views/widgets/form_container_widget.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Login"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Login",
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
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
                  controller.signIn();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: controller.isSigning
                        ? const CircularProgressIndicator(
                            color: Colors.white,
                          )
                        : const Text(
                            "Login",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () {
                  controller.signInWithGoogle();
                },
                child: Container(
                  width: double.infinity,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Ionicons.logo_google,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Sign in with Google",
                          style: TextStyle(
                            color: Colors.white,
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  const SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(Routes.REGISTER);

                      // Navigator.pushAndRemoveUntil(
                      //   context,
                      //   MaterialPageRoute(
                      //       builder: (context) => const SignUpPage()),
                      //   (route) => false,
                      // );
                    },
                    child: const Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

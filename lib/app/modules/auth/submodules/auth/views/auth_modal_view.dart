import 'package:codedelaroute/app/modules/auth/controllers/auth_controller.dart';
import 'package:codedelaroute/app/modules/auth/submodules/login/views/login_modal_content_view.dart';
import 'package:codedelaroute/app/modules/auth/submodules/register/views/register_modal_content_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AuthModalView extends StatefulWidget {
  const AuthModalView({super.key});

  @override
  State<AuthModalView> createState() => _AuthModalViewState();
}

class _AuthModalViewState extends State<AuthModalView> {
  final authController = AuthController();

  AuthMode _authMode = AuthMode.login;

  toggleAuthMode() {
    setState(() {
      _authMode =
          _authMode == AuthMode.login ? AuthMode.regiter : AuthMode.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    authContentModal() {
      switch (_authMode) {
        case AuthMode.login:
          return LoginModalContentView();
        case AuthMode.regiter:
          return const RegisterModalContentView();
        default:
          return const Text("AUth");
      }
    }

    authAltActionText() {
      switch (_authMode) {
        case AuthMode.login:
          return "no_account_question".tr;
        case AuthMode.regiter:
          return "account_exists_question".tr;
        default:
          return "";
      }
    }

    authActionVerb() {
      switch (_authMode) {
        case AuthMode.login:
          return "register".tr;
        case AuthMode.regiter:
          return "login".tr;
        default:
          return "";
      }
    }

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
        () => authController.isAuth
            ? const Text("Already Signed In")
            : Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //
                      Expanded(child: authContentModal()),
                      //
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(authAltActionText()),
                          const SizedBox(
                            width: 5,
                          ),
                          GestureDetector(
                            onTap: () => toggleAuthMode(),
                            child: Text(
                              authActionVerb(),
                              style: const TextStyle(
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
      ),
    );
  }
}

enum AuthMode { login, regiter }

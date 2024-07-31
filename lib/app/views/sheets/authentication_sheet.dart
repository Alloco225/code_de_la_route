import 'package:codedelaroute/app/views/ui/snackbar.dart';
import 'package:flutter/material.dart';

import '../../data/exceptions/http_exception.dart';
import '../widgets/a_grappler.dart';
import '../widgets/make_dismissable.dart';

enum AuthMode { Login, Register }

class AuthenticationSheet extends StatefulWidget {
  const AuthenticationSheet({super.key});

  @override
  _AuthenticationSheetState createState() => _AuthenticationSheetState();
}

class _AuthenticationSheetState extends State<AuthenticationSheet>
    with SingleTickerProviderStateMixin {
  //
  // late AuthMode _authMode;

  final GlobalKey<FormState> _formKey = GlobalKey();
  late AuthMode _authMode;

  // late final MapDataController mapDataController;
  // late final AuthDataController authDataController;

  final Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  var _isLoading = false;
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  late final _passwordController;
  //
  late final _passwordFocusNode;
  late final _passwordConfirmFocusNode;


  Map textData = {
    AuthMode.Login: {
      'title': "Connexion à Ici",
      'subtitle': "Bon retour parmi nous",
      'with_phone': "Se connecter avec Numéro de téléphone ",
      'notice': "Vous n'avez pas de compte ?",
      'notice_btn': "INSCRIPTION",
    },
    AuthMode.Register: {
      'title': "Inscription à Ici",
      'subtitle': "Rejoignez la communauté ICI",
      'with_phone': "S'inscire avec Numéro de téléphone ",
      'notice': "Vous avez déjà un compte ?",
      'notice_btn': "CONNEXION",
    },
  };

  @override
  void initState() {
    super.initState();

    print("<<** Auth sheet");
    // mapDataController = Get.find();
    // authDataController = Get.find();
    //
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(
        milliseconds: 300,
      ),
    );
    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.5),
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.fastOutSlowIn,
      ),
    );
    _opacityAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
    // _heightAnimation.addListener(() => setState(() {}));

    _passwordController = TextEditingController();
    _passwordFocusNode = FocusNode();
    _passwordConfirmFocusNode = FocusNode();


    //
    _authMode = AuthMode.Register;
    _controller.forward();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    _passwordConfirmFocusNode.dispose();
    super.dispose();
  }

  void _switchAuthMode() {
    if (_authMode == AuthMode.Login) {
      setState(() {
        _authMode = AuthMode.Register;
      });
      _controller.forward();
    } else {
      setState(() {
        _authMode = AuthMode.Login;
      });
      _controller.reverse();
    }
  }

  //Auth form submission

  Future<void> _submit() async {
    print(">>> _submit()");
    if (!_formKey.currentState!.validate()) {
      print("form invalid");
      // Invalid!
      return;
    }
    _formKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });
    //
    try {
      if (_authMode == AuthMode.Login) {
        // await authDataController.login(
        //     _authData['email'] as String, _authData['password'] as String);
      } else {
        // Sign user up
        // await authDataController.register(
        //     _authData['email'] as String, _authData['password'] as String);
      }

      // pop and set user
      await Future.delayed(const Duration(seconds: 3));
      //
      //
      Navigator.of(context).pop();
      //
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      //
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      // _showErrorDialog(errorMessage);
      showSnackbarError(
        errorMessage,
        context: context,
      );
    } catch (error) {
      showSnackbarError(
        "Nous n'avons pas pu vous identifier. Veuillez réessayer plus tard",
        context: context,
      );
      // const errorMessage =
      //     'Could not authenticate you. Please try again later.';
      // _showErrorDialog(errorMessage);
    }

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return makeDismissible(
      context: context,
      shouldDismiss: _isLoading,
      child: DraggableScrollableSheet(
        // initialChildSize: 0.9,
        initialChildSize: 1,

        builder: (_, controller) {
          // controller.
          // TODO : disable scroll when _isLoading
          return Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15), topRight: Radius.circular(15)),
            ),
            child: Column(
              children: [
                AGrappler(),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // title
                    Text(
                      textData[_authMode]["title"],
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child:
                      // subtitle
                      Text(
                    textData[_authMode]["subtitle"],
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const Divider(
                  height: 20,
                ),
                const Spacer(),
                Expanded(
                  flex: deviceSize.width > 600 ? 3 : 2,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeIn,
                    height: _authMode == AuthMode.Register ? 320 : 260,
                    // height: _heightAnimation.value.height,
                    constraints: BoxConstraints(
                        minHeight: _authMode == AuthMode.Register ? 320 : 260),

                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      // autovalidateMode: AutovalidateMode.,
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Adresse Email"),
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty || !value.contains('@')) {
                                  return "Email invalide !";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _authData['email'] = value ?? "";
                                //
                              },
                              onEditingComplete: () {
                                _passwordFocusNode.requestFocus();
                              },
                            ),
                            TextFormField(
                              decoration: const InputDecoration(
                                  labelText: "Mot de passe"),
                              obscureText: true,
                              controller: _passwordController,
                              focusNode: _passwordFocusNode,
                              validator: (value) {
                                if (value!.isEmpty || value.length < 5) {
                                  return "Mot de passe trop court!";
                                }
                                return null;
                              },
                              onSaved: (value) {
                                _authData['password'] = value ?? "";
                              },
                              onEditingComplete: () {
                                //
                                if (_authMode == AuthMode.Register) {
                                  _passwordConfirmFocusNode.requestFocus();
                                  return;
                                }
                                //
                                _submit();
                              },
                            ),
                            AnimatedContainer(
                              constraints: BoxConstraints(
                                minHeight:
                                    _authMode == AuthMode.Register ? 60 : 0,
                                maxHeight:
                                    _authMode == AuthMode.Register ? 120 : 0,
                              ),
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeIn,
                              child: FadeTransition(
                                opacity: _opacityAnimation,
                                child: SlideTransition(
                                  position: _slideAnimation,
                                  child: TextFormField(
                                    focusNode: _passwordConfirmFocusNode,
                                    enabled: _authMode == AuthMode.Register,
                                    decoration: const InputDecoration(
                                        labelText: 'Confirmez mot de passe'),
                                    obscureText: true,
                                    validator: _authMode == AuthMode.Register
                                        ? (value) {
                                            if (value !=
                                                _passwordController.text) {
                                              return "Les mots de passe sont différents!";
                                            }
                                            return null;
                                          }
                                        : null,
                                    onEditingComplete: _submit,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            if (_isLoading)
                              const CircularProgressIndicator()
                            else
                              ElevatedButton(
                                child: Text(_authMode == AuthMode.Login
                                    ? 'SE CONNECTER'
                                    : "S'INSCRIRE"),
                                onPressed: _submit,
                                // shape: RoundedRectangleBorder(
                                //   borderRadius: BorderRadius.circular(10),
                                // ),
                                // padding: const EdgeInsets.symmetric(
                                //     horizontal: 30.0, vertical: 8.0),
                                // color: Theme.of(context).primaryColor,
                                // textColor: Theme.of(context)
                                //     .primaryTextTheme
                                //     .labelLarge
                                //     ?.color,
                              ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

                const Spacer(),
                // Conditions

                Container(
                  color: Colors.grey[100],
                  padding: const EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        textData[_authMode]["notice"],
                        style: const TextStyle(
                          // color: Colors.red,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      InkWell(
                        onTap: _isLoading ? null : _switchAuthMode,
                        child: Text(
                          textData[_authMode]["notice_btn"],
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class LoginMethod extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback? callback;

  const LoginMethod(
    this.text, {
    super.key,
    required this.icon,
    this.callback,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        padding: const EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: callback != null ? Colors.white : Colors.grey[300],
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Icon(
            icon,
          ),
          title: Text(
            text,
          ),
        ),
      ),
    );
  }
}

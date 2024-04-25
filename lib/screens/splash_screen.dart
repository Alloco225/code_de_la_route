import 'package:code_de_la_route/routes.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key}); // Fixed super keyword

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  // Added SingleTickerProviderStateMixin for animation

  late AnimationController _animationController;
  late Animation<double> _opacityAnimation;
  late Animation<Offset> _translateAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2), // Duration for animations
    );

    _opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _translateAnimation = Tween<Offset>(
      begin: const Offset(0.0, -1.0),
      end: const Offset(0.0, 0.0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _animationController.forward();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    //

    redirect();
  }

  redirect() async {
    await Future.delayed(const Duration(seconds: 2));
    Navigator.of(context).popAndPushNamed(Routes.home);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Logo with opacity and translate animations
          SlideTransition(
            position: _translateAnimation,
            child: FadeTransition(
              opacity: _opacityAnimation,
              child: Center(
                child: SizedBox(
                  width: 300,
                  child: Image.asset('assets/images/logo.png'),
                ),
              ),
            ),
          ),
          // Version text with opacity animation
          FadeTransition(
            opacity: _opacityAnimation,
            child: const Text(
              "v1.0.0", 
              semanticsLabel: "v1.0.0", 
              ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

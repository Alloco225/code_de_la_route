import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo
            Center(
              child: SizedBox(
                width: 300,
                height: 300,
                child: Placeholder(),
                // Image.asset('/images/logo.png'),
              ),
            ),
            // TODO add animation separate from center
            Text("Code de la Route"),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamed(context, '/login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            // Background image
            Image.asset(
              'assets/img/bg.png',
              fit: BoxFit.cover,
            ),
            // Logo centered in the middle of the background image
            Positioned(
              top: MediaQuery.of(context).size.height * 0.5 - 125, // وضع اللوجو في النصف العلوي للخلفية
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/img/logo_img/splash.png',
                  width: 280,
                  height: 280,
                ),
              ),
            ),
          ],
        ),
    );
  }
}

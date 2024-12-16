import 'package:flutter/material.dart';
import 'package:mira_fitness/admin_home/admin_home.dart';
import 'package:mira_fitness/constants.dart';
import 'package:mira_fitness/user_products/product_details.dart';
import 'package:mira_fitness/splash/splash_screen.dart';
import 'package:mira_fitness/login/login.dart';
import 'package:mira_fitness/user_home/user_home_page.dart';
import 'package:mira_fitness/user_menu/user_menu.dart';
import 'package:mira_fitness/user_menu/user_profile.dart';
import 'package:mira_fitness/user_products/all_products_page.dart';

import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // to make the app arabic and start writing from right to left
      localizationsDelegates: const [
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("ar", "EGY"),
      ],
      locale: const Locale("ar", "EGY"),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),
        '/login': (context) => LoginScreen(),
        '/user_home': (context) => HomeScreen(),
        '/product_details': (context) => ProductDetails(),
        '/menu': (context) => const UserMenu(),
        '/profile': (context) => UserProfile(),
        '/all_products': (context) => AllProductsPage(),
        '/dashboard': (context) => Dashboard(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Mira Fitness',
      theme: ThemeData(
        colorSchemeSeed: white,
      ),
    );
  }
}

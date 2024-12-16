import 'package:flutter/material.dart';
import 'package:mira_fitness/user_menu/user_menu.dart';
import '../constants.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class UserChangePassword extends StatelessWidget {
  // UserChangePassword({Key? key, this.isNavigatedFromMenu = false})
  //     : super(key: key);

  final _advancedDrawerController = AdvancedDrawerController();
  // final bool isNavigatedFromMenu;

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: UserMenu(),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color.fromARGB(255, 0, 0, 0),
              Color.fromARGB(255, 29, 29, 10)
            ],
          ),
        ),
      ),
      controller: _advancedDrawerController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      openRatio: 0.6,
      disabledGestures: false,
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              'assets/img/bg2.png',
              fit: BoxFit.cover,
            ),
            const Positioned(
              top: 55,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  "تغيير الرقم السري",
                  style: TextStyle(
                    fontFamily: "Tajawal",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 48,
              left: 3,
              child: GestureDetector(
                onTap: () {
                  _advancedDrawerController.showDrawer();
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: const Icon(
                    Icons.menu_rounded,
                    size: 35,
                    color: white,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 110,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 110,
                decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.fromLTRB(25, 25, 25, 25),
              child: Column(
                children: [
                  const TextField(
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontFamily: 'Tajawal'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'ادخل الرقم السري القديم',
                    ),
                  ),
                  const SizedBox(height: 20),
                  const TextField(
                    textInputAction: TextInputAction.next,
                    style: TextStyle(fontFamily: 'Tajawal'),
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'ادخل الرقم السري الجديد',
                    ),
                  ),
                  const SizedBox(height: 40),
                  ElevatedButton(
                    onPressed: () {
                      // Navigator.pushNamed(context, '/home');
                    },
                    style: ButtonStyle(
                      backgroundColor: WidgetStateProperty.all(black),
                      minimumSize: WidgetStateProperty.all(
                        Size(
                          MediaQuery.of(context)
                              .size
                              .width, // استخدام عرض الشاشة
                          50, // ارتفاع الزر
                        ),
                      ),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(11),
                        ),
                      ),
                    ),
                    child: const Text(
                      "حفظ",
                      style: TextStyle(
                        color: white,
                        fontSize: 16,
                        fontFamily: 'Tajawal',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
              ),
            )
          ],
        )
      ),
    );
  }
}





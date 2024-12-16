import 'package:flutter/material.dart';
import 'package:mira_fitness/admin_home/admin_home.dart';
import 'package:mira_fitness/user_menu/user_change_password.dart';
import 'package:mira_fitness/user_menu/user_profile.dart';
import 'package:mira_fitness/user_menu/user_subscription.dart';
import 'package:mira_fitness/user_products/all_products_page.dart';
import '../constants.dart';

MenuPages selectedMenuPage = MenuPages.dashboard;

enum MenuPages {
  dashboard,
  members,
  products,
  staff,
  exports,
  imports,
  prices,
  logout
}

class AdminMenu extends StatefulWidget {
  const AdminMenu({super.key});

  @override
  State<AdminMenu> createState() => _MenuState();
}

class _MenuState extends State<AdminMenu> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        child: ListTileTheme(
          textColor: Colors.white,
          iconColor: Colors.white,
          child: Column(
            children: [
              Center(
                child: Container(
                  width: 120.0,
                  height: 120.0,
                  margin: const EdgeInsets.only(
                    top: 20.0,
                  ),
                  child: Image.asset(
                    'assets/img/logo_img/splash.png',
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.dashboard;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Dashboard(),
                      ),
                    );
                  });
                },
                leading: Icon(
                  Icons.home,
                  color: selectedMenuPage == MenuPages.dashboard
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'الصفحة الرئيسيه',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.dashboard
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.members;
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserProfile(),
                    //   ),
                    // );
                  });
                },
                leading: Icon(
                  Icons.group,
                  color: selectedMenuPage == MenuPages.members
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'المشتركون',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.members
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
                            ListTile(
                onTap: () {
                  selectedMenuPage = MenuPages.products;
                },
                leading: Icon(
                  Icons.shopping_cart,
                  color: selectedMenuPage == MenuPages.products
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'المنتجات',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.products
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.products;
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) =>
                    //         AllProductsPage(isMenuIconVisible: true),
                    //   ),
                    // );
                  });
                },
                leading: Icon(
                  Icons.business_center,
                  color: selectedMenuPage == MenuPages.products
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'الموظفون',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.products
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.exports;
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserSubscription(),
                    //   ),
                    // );
                  });
                },
                leading: Icon(
                  Icons.outbox,
                  color: selectedMenuPage == MenuPages.exports
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text( 
                  'الصادرات',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.exports
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.imports;
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(
                    //     builder: (context) => UserChangePassword(),
                    //   ),
                    // );
                  });
                },
                leading: Icon(
                  Icons.move_to_inbox,
                  color: selectedMenuPage == MenuPages.imports
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'الايرادات',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.imports
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  selectedMenuPage = MenuPages.prices;
                },
                leading: Icon(
                  Icons.monetization_on,
                  color: selectedMenuPage == MenuPages.prices
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'الاسعار',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.prices
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  selectedMenuPage = MenuPages.logout;
                },
                leading: Icon(
                  Icons.logout,
                  color: selectedMenuPage == MenuPages.logout
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.logout
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              const Spacer(),
              //               ListTile(
              //   onTap: () {
              //     selectedMenuPage = MenuPages.logoutPage;
              //   },
              //   leading: Icon(
              //     Icons.logout,
              //     color: selectedMenuPage == MenuPages.logoutPage
              //         ? kActiveColor
              //         : kInActiveColor,
              //   ),
              //   title: Text(
              //     'العروض',
              //     style: TextStyle(
              //         color: selectedMenuPage == MenuPages.logoutPage
              //             ? kActiveColor
              //             : kInActiveColor,
              //         fontFamily: "Tajawal",
              //         fontSize: 16),
              //   ),
              // ),
              // Spacer(),
              //               ListTile(
              //   onTap: () {
              //     selectedMenuPage = MenuPages.logoutPage;
              //   },
              //   leading: Icon(
              //     Icons.logout,
              //     color: selectedMenuPage == MenuPages.logoutPage
              //         ? kActiveColor
              //         : kInActiveColor,
              //   ),
              //   title: Text(
              //     'الضبط',
              //     style: TextStyle(
              //         color: selectedMenuPage == MenuPages.logoutPage
              //             ? kActiveColor
              //             : kInActiveColor,
              //         fontFamily: "Tajawal",
              //         fontSize: 16),
              //   ),
              // ),
              // Spacer(),
              // DefaultTextStyle(
              //   style: TextStyle(
              //     fontSize: 12,
              //     color: Colors.white54,
              //   ),
              //   child: Container(
              //     margin: const EdgeInsets.symmetric(
              //       vertical: 16.0,
              //     ),
              //     child: Text('Terms of Service | Privacy Policy'),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}

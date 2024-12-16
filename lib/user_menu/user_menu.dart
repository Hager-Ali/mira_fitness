import 'package:flutter/material.dart';
import 'package:mira_fitness/user_home/user_home_page.dart';
import 'package:mira_fitness/user_menu/user_change_password.dart';
import 'package:mira_fitness/user_menu/user_profile.dart';
import 'package:mira_fitness/user_menu/user_subscription.dart';
import 'package:mira_fitness/user_products/all_products_page.dart';
import '../constants.dart';

MenuPages selectedMenuPage = MenuPages.homePage;

enum MenuPages {
  homePage,
  profilePage,
  packagesPage,
  productsPage,
  changePasswordPage,
  logoutPage
}

class UserMenu extends StatefulWidget {
  const UserMenu({super.key});

  @override
  State<UserMenu> createState() => _MenuState();
}

class _MenuState extends State<UserMenu> {
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
                    top: 40.0,
                    bottom: 50.0,
                  ),
                  child: Image.asset(
                    'assets/img/logo_img/splash.png',
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.homePage;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeScreen(),
                      ),
                    );
                  });
                },
                leading: Icon(
                  Icons.home,
                  color: selectedMenuPage == MenuPages.homePage
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'الصفحة الرئيسيه',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.homePage
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.profilePage;
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserProfile(),
                          ),
                        );
                  });
                },
                leading: Icon(
                  Icons.account_circle,
                  color: selectedMenuPage == MenuPages.profilePage
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'صفحتي',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.profilePage
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
                            ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.productsPage;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            AllProductsPage(isMenuIconVisible: true),
                      ),
                    );
                  });
                },
                leading: Icon(
                  Icons.shopping_cart,
                  color: selectedMenuPage == MenuPages.productsPage
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'المنتجات',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.productsPage
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.packagesPage;
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                UserSubscription(),
                          ),
                        );
                  });
                },
                leading: Icon(
                  Icons.payment,
                  color: selectedMenuPage == MenuPages.packagesPage
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'الاشتراكات',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.packagesPage
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  setState(() {
                    selectedMenuPage = MenuPages.changePasswordPage;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            UserChangePassword(),
                      ),
                    );
                  });
                },
                leading: Icon(
                  Icons.password,
                  color: selectedMenuPage == MenuPages.changePasswordPage
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'تغيير الرقم السري',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.changePasswordPage
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              ListTile(
                onTap: () {
                  selectedMenuPage = MenuPages.logoutPage;
                },
                leading: Icon(
                  Icons.logout,
                  color: selectedMenuPage == MenuPages.logoutPage
                      ? kActiveColor
                      : kInActiveColor,
                ),
                title: Text(
                  'تسجيل الخروج',
                  style: TextStyle(
                      color: selectedMenuPage == MenuPages.logoutPage
                          ? kActiveColor
                          : kInActiveColor,
                      fontFamily: "Tajawal",
                      fontSize: 16),
                ),
              ),
              Spacer(),
              DefaultTextStyle(
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.white54,
                ),
                child: Container(
                  margin: const EdgeInsets.symmetric(
                    vertical: 16.0,
                  ),
                  child: Text('Terms of Service | Privacy Policy'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

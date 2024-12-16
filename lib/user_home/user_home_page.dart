import 'package:flutter/material.dart';
import 'package:mira_fitness/user_menu/user_menu.dart';
import 'package:mira_fitness/user_products/widgets/products_widget.dart';
import 'package:mira_fitness/user_home/widgets/services_widget.dart';
import 'package:mira_fitness/user_home/widgets/banner_widget.dart';
import 'package:mira_fitness/user_products/all_products_page.dart';
import '../constants.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _advancedDrawerController = AdvancedDrawerController();

  final String traineeName = "هاجر";
  final String trainingName = "Fitness & billy dance";
  final String bannerImage = 'assets/img/banner_img/offer1.png';

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: const UserMenu(),
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
        backgroundColor: white,
        // ------------->> Appbar part <<-------------
        appBar: AppBar(
          surfaceTintColor: white,
          leadingWidth: 45,
          backgroundColor: white,
          toolbarHeight: 70,
          leading: IconButton(
            padding: const EdgeInsets.only(right: 5),
            icon: const Icon(
              Icons.notifications,
              size: 30,
              color: black,
            ),
            color: Colors.grey.shade600,
            onPressed: () {},
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'مرحبا، $traineeName',
                style: const TextStyle(
                  fontSize: 20,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Text(
                    'اشتراكك الان ',
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                    ),
                  ),
                  Text(
                    trainingName,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: 'Tajawal',
                      color: darkYellow,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            InkWell(
              onTap: () {
                _advancedDrawerController.showDrawer();
              },
              child: Container(
                margin: const EdgeInsets.only(left: 5),
                child: const Icon(
                  Icons.menu_rounded,
                  size: 35,
                  color: black,
                ),
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // ------------->> offer part <<-------------
              OfferBanner(bannerImage: bannerImage),
              // ------------->> Products part <<-------------
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'المنتجات',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                AllProductsPage(isMenuIconVisible: false),
                          ),
                        );
                      },
                      child: Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: darkYellow, // لون الخط تحت النص
                              width: 2.0, // عرض الخط تحت النص
                            ),
                          ),
                        ),
                        child: const Text(
                          'الكل',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Tajawal',
                            fontWeight: FontWeight.w500,
                            color: darkYellow,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Products(
                          productImage: "assets/img/products_img/img1.png",
                          productName: "عسل نحل",
                          productPrice: "110ج",
                          onPress: () {
                            Navigator.pushNamed(context, '/product_details');
                          }),
                      Products(
                          productImage: "assets/img/products_img/img2.png",
                          productName: "شكولاته بروتين",
                          productPrice: "75ج",
                          onPress: () {
                            Navigator.pushNamed(context, '/product_details');
                          }),
                      Products(
                          productImage: "assets/img/products_img/img3.png",
                          productName: "فطور صحي",
                          productPrice: "215ج",
                          onPress: () {
                            Navigator.pushNamed(context, '/product_details');
                          }),
                      Products(
                          productImage: "assets/img/products_img/img1.png",
                          productName: "عسل نحل",
                          productPrice: "110ج",
                          onPress: () {
                            Navigator.pushNamed(context, '/product_details');
                          }),
                    ],
                  ),
                ),
              ),
              // ------------->> Services part <<-------------
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 15, 7),
                    child: const Text(
                      'الخدمات',
                      style: TextStyle(
                        fontSize: 20,
                        fontFamily: 'Tajawal',
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.start,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Services(
                    serviceIcon: "assets/img/services_img/fitness.png",
                    serviceTitle: "فيتنس",
                    serviceContent:
                        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا. يوت انيم أد مينيم فينايم",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Services(
                    serviceIcon: "assets/img/services_img/boxing.png",
                    serviceTitle: "كيك بوكس",
                    serviceContent:
                        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا. يوت انيم أد مينيم فينايم",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Services(
                    serviceIcon: "assets/img/services_img/dance.png",
                    serviceTitle: "بيلي دانس",
                    serviceContent:
                        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا. يوت انيم أد مينيم فينايم",
                  ),
                  const SizedBox(height: 10),
                  Services(
                    serviceIcon: "assets/img/services_img/massage.png",
                    serviceTitle: "مساج و حجامه",
                    serviceContent:
                        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا. يوت انيم أد مينيم فينايم",
                  ),
                  const SizedBox(height: 10),
                  Services(
                    serviceIcon: "assets/img/services_img/electrotherapy.png",
                    serviceTitle: "علاج طبيعي",
                    serviceContent:
                        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا. يوت انيم أد مينيم فينايم",
                  ),
                  const SizedBox(height: 10),
                  Services(
                    serviceIcon: "assets/img/services_img/sauna.png",
                    serviceTitle: "ساونا",
                    serviceContent:
                        "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت,سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا. يوت انيم أد مينيم فينايم",
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _handleMenuButtonPressed() {
    // NOTICE: Manage Advanced Drawer state through the Controller.
    _advancedDrawerController.value = AdvancedDrawerValue.visible();
    _advancedDrawerController.showDrawer();
  }
}

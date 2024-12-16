import 'package:flutter/material.dart';
import 'package:mira_fitness/user_products/widgets/all_products_widget.dart';
import 'package:mira_fitness/user_menu/user_menu.dart';
import '../constants.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';

class AllProductsPage extends StatelessWidget {
  AllProductsPage(
      {Key? key,
      this.isMenuIconVisible = false,
      })
      : super(key: key);

  final _advancedDrawerController = AdvancedDrawerController();
  final bool isMenuIconVisible;

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
                  "المنتجات",
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
              left: isMenuIconVisible ? 3 : null,
              right: isMenuIconVisible ? null : 7,
              child: GestureDetector(
                onTap: () {
                  if (isMenuIconVisible) {
                    _advancedDrawerController.showDrawer();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Container(
                  margin: const EdgeInsets.only(left: 5),
                  child: Icon(
                    isMenuIconVisible ? Icons.menu_rounded : Icons.arrow_back,
                    size: isMenuIconVisible ? 35 : 30,
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
            child: Column(
              children: [
                const SizedBox(
                  height: 15,
                ),
                AllProducts(
                    onPress: () {
                      Navigator.pushNamed(context, '/product_details');
                    },
                    productImage: "assets/img/products_img/img1.png",
                    productName: "عسل نحل",
                    productPrice: "110ج",
                    productDetails:
                        "التخفيف من السعال: حيث ذكر تحليل إحصائي ومراجعة منهجيّة لـ 6 دراسات، ونشر في مجلة The Cochrane Database of Systematic Reviews عام 2018 أن العسل قد يؤدي إلى تخفيف أعراض السعال عند الأطفال، كما يقلل من مدة الإصابة به"),
                AllProducts(
                    onPress: () {
                      Navigator.pushNamed(context, '/product_details');
                    },
                    productImage: "assets/img/products_img/img2.png",
                    productName: "شكولاته بروتين",
                    productPrice: "75ج",
                    productDetails:
                        "يحتوي البروتين بار على مجموعة من المكونات، ولكن الأمر الذي يجهله العديد أنها تحتوي على مواد قد تندرج تحت المكونات الصحية وغير الصحية أيضاً، وذلك اعتماداً على نوع البروتين بار المختار. "),
                AllProducts(
                    onPress: () {
                      Navigator.pushNamed(context, '/product_details');
                    },
                    productImage: "assets/img/products_img/img3.png",
                    productName: "فطور صحي",
                    productPrice: "215ج",
                    productDetails:
                        "قد تحتوي الوجبة الأولى في اليوم وهي الفطور على المصادر الصحيّة للكربوهيدرات لتزويد الجسم بالطاقة، والدهون والألياف الغذائيّة التي تُساعد على إعطاء الشعورٍ بالشبع، كما يجب أن تحتوي على البروتين؛ حيث إنّه يُساهم في بناء العضلات والمحافظة عليها"),
                AllProducts(
                    onPress: () {
                      Navigator.pushNamed(context, '/product_details');
                    },
                    productImage: "assets/img/products_img/img1.png",
                    productName: "عسل نحل",
                    productPrice: "110ج",
                    productDetails:
                        "التخفيف من السعال: حيث ذكر تحليل إحصائي ومراجعة منهجيّة لـ 6 دراسات، ونشر في مجلة The Cochrane Database of Systematic Reviews عام 2018 أن العسل قد يؤدي إلى تخفيف أعراض السعال عند الأطفال، كما يقلل من مدة الإصابة به"),
                AllProducts(
                    onPress: () {
                      Navigator.pushNamed(context, '/product_details');
                    },
                    productImage: "assets/img/products_img/img1.png",
                    productName: "عسل نحل",
                    productPrice: "110ج",
                    productDetails:
                        "التخفيف من السعال: حيث ذكر تحليل إحصائي ومراجعة منهجيّة لـ 6 دراسات، ونشر في مجلة The Cochrane Database of Systematic Reviews عام 2018 أن العسل قد يؤدي إلى تخفيف أعراض السعال عند الأطفال، كما يقلل من مدة الإصابة به"),
              ],
            ),
          ),
              ),
            )
          ],
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


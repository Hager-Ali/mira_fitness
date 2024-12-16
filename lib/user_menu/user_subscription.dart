import 'package:flutter/material.dart';
import 'package:mira_fitness/user_menu/user_menu.dart';
import '../constants.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class UserSubscription extends StatefulWidget {
  @override
  State<UserSubscription> createState() => _UserSubscriptionState();
}

class _UserSubscriptionState extends State<UserSubscription> {
  final _advancedDrawerController = AdvancedDrawerController();
  int _current = 0;
  bool _isGymButtonPressed = true;
  bool _isCuppingButtonPressed = false;

  final List<Map<String, dynamic>> gymPrices = [
    {
      'price': '350 ج',
      'details': ['شهر واحد', 'حضور يومي', 'فترة صباحي', 'فترة مسائي', 'ساونا', 'أنبوبي']
    },
    {
      'price': '250 ج',
      'details': ['شهر واحد', 'حضور يومي', 'فترة صباحي فقط', 'ساونا', 'أنبوبي']
    },
    {
      'price': '600 ج',
      'details': ['عرض 6 أصدقاء', 'شهر واحد ', 'حضور يومي', 'فترة صباحي', 'فترة مسائي', 'ساونا', 'أنبوبي']
    },
    {
      'price': '850 ج',
      'details': ['عرض 3 أصدقاء', 'شهر واحد ', 'حضور يومي', 'فترة صباحي', 'فترة مسائي', 'ساونا', 'أنبوبي']
    },
    {
      'price': '900 ج',
      'details': ['عرض 4 أصدقاء', 'شهر واحد ', 'حضور يومي', 'فترة صباحي', 'فترة مسائي', 'ساونا', 'أنبوبي']
    },
    {
      'price': '1800 ج',
      'details': ['6 شهور ', 'حضور يومي', 'فترة صباحي', 'فترة مسائي', 'ساونا', 'أنبوبي']
    },
    {
      'price': '3600 ج',
      'details': ['12 شهور ', 'حضور يومي', 'فترة صباحي', 'فترة مسائي', 'ساونا', 'أنبوبي']
    },
    {
      'price': '300 ج',
      'details': ['12 كلاس ', 'شهر واحد', 'برايفت', 'فترة صباحي', 'فترة مسائي', 'ساونا', 'أنبوبي']
    },
    {
      'price': '550 ج',
      'details': ['24 كلاس ', 'شهر واحد', 'برايفت', 'فترة صباحي', 'فترة مسائي', 'ساونا', 'أنبوبي']
    },
  ];

  final List<Map<String, dynamic>> cuppingPrices = [
    {
      'price': '400 ج',
      'details': ['حجامه', 'نصف الجسم']
    },
    {
      'price': '500 ج',
      'details': ['حجامه', 'كل الجسم']
    },
  ];

  List<Map<String, dynamic>> get _currentSubscriptions {
    return _isGymButtonPressed ? gymPrices : cuppingPrices;
  }

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
                  "الاشتراكات",
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
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _isGymButtonPressed = true;
                                    _isCuppingButtonPressed = false;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  surfaceTintColor: yellow,
                                  foregroundColor: white,
                                  shadowColor: _isGymButtonPressed ? lightGrey : null,
                                  elevation: _isGymButtonPressed ? 3 : 0,
                                  backgroundColor: _isGymButtonPressed ? white : white,
                                  side: BorderSide(
                                    color: _isGymButtonPressed ? lightGrey : lightGrey,
                                    width: _isGymButtonPressed ? 0 : 2,
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                child: Text(
                                  "الجيم",
                                  style: TextStyle(
                                    color: _isGymButtonPressed ? black : Color(0xFF585858),
                                    fontSize: 16,
                                    fontFamily: 'Tajawal',
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {
                                  setState(() {
                                    _isGymButtonPressed = false;
                                    _isCuppingButtonPressed = true;
                                  });
                                },
                                style: OutlinedButton.styleFrom(
                                  surfaceTintColor: yellow,
                                  foregroundColor: white,
                                  shadowColor: _isCuppingButtonPressed ? lightGrey : null,
                                  elevation: _isCuppingButtonPressed ? 3 : 0,
                                  backgroundColor: _isCuppingButtonPressed ? white : white,
                                  side: BorderSide(
                                    color: _isCuppingButtonPressed ? lightGrey : lightGrey,
                                    width: _isCuppingButtonPressed ? 0 : 2,
                                  ),
                                  minimumSize: const Size(double.infinity, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(11),
                                  ),
                                ),
                                child: Text(
                                  "الحجامه",
                                  style: TextStyle(
                                    color: _isCuppingButtonPressed ? black : Color(0xFF585858),
                                    fontSize: 16,
                                    fontFamily: 'Tajawal',
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      CarouselSlider.builder(
                        options: CarouselOptions(
                          height: 370.0,
                          enlargeCenterPage: true,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.7,
                          onPageChanged: (index, reason) {
                            setState(() {
                              _current = index;
                            });
                          },
                        ),
                        itemCount: _currentSubscriptions.length,
                        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                          bool isCenter = itemIndex == _current;
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: isCenter ? black : lightGrey,
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            child: SubscriptionCard(
                              price: _currentSubscriptions[itemIndex]['price'],
                              details: _currentSubscriptions[itemIndex]['details'],
                              isCenter: isCenter,
                            ),
                          );
                        },
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 30),
                        child: buildCarouselIndicator(),
                      )
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

  buildCarouselIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (int i = 0; i < _currentSubscriptions.length; i++)
          Container(
            margin: const EdgeInsets.all(5),
            height: i == _current ? 8 : 5,
            width: i == _current ? 8 : 5,
            decoration: BoxDecoration(
              color: i == _current ? black : Colors.grey,
              shape: BoxShape.circle,
            ),
          )
      ],
    );
  }
}

class SubscriptionCard extends StatelessWidget {
  final String price;
  final List<String> details;
  final bool isCenter;

  SubscriptionCard({
    required this.price,
    required this.details,
    required this.isCenter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          price,
          style: const TextStyle(
            fontSize: 24,
            color: yellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        for (var detail in details)
          Text(
            detail,
            style: const TextStyle(
              fontSize: 16,
              color: white,
            ),
          ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:mira_fitness/admin_home/widgets/dashboard_cards.dart';
import 'package:mira_fitness/admin_menu/admin_menu.dart';
import 'package:mira_fitness/constants.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  final _advancedDrawerController = AdvancedDrawerController();

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      drawer: const AdminMenu(),
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
            Positioned(
              top: 40,
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
              top: 40,
              right: 3,
              child: IconButton(
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                  color: white,
                ),
                color: Colors.grey.shade600,
                onPressed: () {},
              ),
            ),
            Positioned(
              top: 100,
              right: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.attach_money,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 6,
                      ),
                      Text(
                        "الرصيد الاجمالي",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          fontFamily: "Tajawal",
                        ),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 10),
                        child: Text(
                          "20,350",
                          style: TextStyle(
                            color: white,
                            fontSize: 25,
                            fontFamily: "Tajawal",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            Positioned(
              top: 180,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height - 180,
                decoration: const BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25))),
                child: SingleChildScrollView(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 22, horizontal: 22),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          children: [
                            DashboardCards(
                              DashboardCardIcon:
                                  "assets/img/dashboard_img/growth.png",
                              DashboardCardValue: "568",
                              DashboardCardTitle: "الايراد اليومي",
                            ),
                            const SizedBox(width: 12),
                            DashboardCards(
                              DashboardCardIcon:
                                  "assets/img/dashboard_img/expenses.png",
                              DashboardCardValue: "1600",
                              DashboardCardTitle: "المصروفات",
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            DashboardCards(
                              DashboardCardIcon:
                                  "assets/img/dashboard_img/members.png",
                              DashboardCardValue: "240",
                              DashboardCardTitle: "كل المشتركين",
                            ),
                            const SizedBox(width: 12),
                            DashboardCards(
                              DashboardCardIcon:
                                  "assets/img/dashboard_img/calendar.png",
                              DashboardCardValue: "23",
                              DashboardCardTitle: "المشتركين\nهذا الشهر",
                            )
                          ],
                        ),
                        // Positioned(
                        //     top: 640,
                        //     right: 0,
                        //     left: 0,
                        //     child: DashboardChart()),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

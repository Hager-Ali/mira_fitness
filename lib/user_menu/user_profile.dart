import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mira_fitness/user_menu/user_menu.dart';
import 'package:mira_fitness/user_menu/widgets/user_profile_cards.dart';
import 'package:mira_fitness/user_menu/widgets/user_profile_gridview.dart';
import '../constants.dart';

import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

ProfileCards selectedCard = ProfileCards.subscription;

enum ProfileCards {
  subscription,
  workouts,
  attendance,
  inbody,
  diet,
  personalData,
  health
}

class UserProfile extends StatefulWidget {
  // UserProfile({Key? key, this.isNavigatedFromMenu = false}) : super(key: key);

  // final bool isNavigatedFromMenu;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final _advancedDrawerController = AdvancedDrawerController();

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
                  "صفحتي",
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
                      const SizedBox(
                        height: 20,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Container(
                          padding: const EdgeInsets.only(right: 15, left: 15),
                          height: 90,
                          child: Row(children: [
                            UserProfileCards(
                                UserProfileCardIcon:
                                    "assets/img/profile_img/membership.png",
                                UserProfileCardTitle: "تفاصيل اشتراكي",
                                isActive:
                                    selectedCard == ProfileCards.subscription,
                                onTap: () {
                                  setState(() {
                                    selectedCard = ProfileCards.subscription;
                                  });
                                }),
                            const SizedBox(
                              width: 12,
                            ),
                            UserProfileCards(
                                UserProfileCardIcon:
                                    "assets/img/profile_img/exercise.png",
                                UserProfileCardTitle: "تمارين الاسبوع",
                                isActive: selectedCard == ProfileCards.workouts,
                                onTap: () {
                                  setState(() {
                                    selectedCard = ProfileCards.workouts;
                                  });
                                }),
                            const SizedBox(
                              width: 12,
                            ),
                            UserProfileCards(
                                UserProfileCardIcon:
                                    "assets/img/profile_img/attendance.png",
                                UserProfileCardTitle: "الحضور",
                                isActive:
                                    selectedCard == ProfileCards.attendance,
                                onTap: () {
                                  setState(() {
                                    selectedCard = ProfileCards.attendance;
                                  });
                                }),
                            const SizedBox(
                              width: 12,
                            ),
                            UserProfileCards(
                                UserProfileCardIcon:
                                    "assets/img/profile_img/diet.png",
                                UserProfileCardTitle: "نظامي الغذائي",
                                isActive: selectedCard == ProfileCards.diet,
                                onTap: () {
                                  setState(() {
                                    selectedCard = ProfileCards.diet;
                                  });
                                }),
                            const SizedBox(
                              width: 12,
                            ),
                            UserProfileCards(
                                UserProfileCardIcon:
                                    "assets/img/profile_img/my_data.png",
                                UserProfileCardTitle: "بياناتي الشخصية",
                                isActive:
                                    selectedCard == ProfileCards.personalData,
                                onTap: () {
                                  setState(() {
                                    selectedCard = ProfileCards.personalData;
                                  });
                                }),
                          ]),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: _buildProfileContent(),
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
}

Map<String, String> _buildAttendanceContent() {
  List<String> attendanceDays = [
    "22/05/2024",
    "21/05/2024",
    "20/05/2024",
    "19/05/2024",
    "18/05/2024",
  ];

  Map<String, String> attendanceMap = {};
  int dayNumber = 1;

  for (String day in attendanceDays) {
    attendanceMap["اليوم $dayNumber"] = day;
    dayNumber++;
  }
  return attendanceMap;
}

class PDFButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        final file = await _loadPDF();
        if (file != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PDFViewerPage(path: file.path),
            ),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        minimumSize: Size(MediaQuery.of(context).size.width - 50, 50),
        backgroundColor: white,
        side: const BorderSide(
          color: Color.fromARGB(255, 189, 214, 44),
        ), // تعيين الظل إلى قيمة 0.0 لإخفائه
      ),
      child: const Text(
        "عرض النظام الغذائي",
        style: TextStyle(
          fontFamily: "Tajawal",
          color: Color.fromARGB(255, 163, 185, 36),
        ),
      ),
    );
  }

  Future<File?> _loadPDF() async {
    try {
      return await fromAsset('assets/diet.pdf', 'diet.pdf');
    } catch (e) {
      // Handle error if necessary
      return null;
    }
  }

  Future<File> fromAsset(String asset, String filename) async {
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      completer.completeError('Error parsing asset file!');
    }

    return completer.future;
  }
}

class PDFViewerPage extends StatelessWidget {
  final String path;

  PDFViewerPage({required this.path});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("عرض النظام الغذائي"),
      ),
      body: SfPdfViewer.file(File(path)),
    );
  }
}

Widget _buildProfileContent() {
  switch (selectedCard) {
    case ProfileCards.subscription:
      return UserProfileGridView(
        profileContent: {
          "نوع الاشتراك": "عادي",
          "تاريخ الاشتراك": "08/05/2024",
          "اسم التدريب": "فيتنس",
          "مدة الاشتراك": "1شهر",
          "تاريخ البدء": "08/05/2024",
          "تاريخ الانتهاء": "08/06/2024",
          "حاله المشترك": "نشط",
          "اسم العرض": "لا يوجد عرض",
          "المدفوع": "350",
          "المتبقي": "0 ",
          "الهدف من التدريب": "التخسيس "
        },
      );
    case ProfileCards.workouts:
      return UserProfileGridView(
        profileContent: {
          "يوم السبت": "Bi & Tri & chest",
          "يوم الاحد": "Glutes",
          "يوم الاثنين": "break",
          "يوم الثلاثاء": "Back & core",
          "يوم الاربعاء": "Leg",
          "يوم الخميس": "Break",
          "يوم الجمعه": "Shoulder & Bi",
          "ملاحظات عامه": "لا يوجد ملاحظات ",
        },
      );
    case ProfileCards.attendance:
      return UserProfileGridView(
        profileContent: _buildAttendanceContent(),
      );
    case ProfileCards.inbody:
      return UserProfileGridView(
        profileContent: {
          "التاريخ": "22/05/2024",
          "الطول": "160",
          "الوزن": "55",
          "الكتف": "160",
          "الصدر": "55",
          "اسفل الصدر": "63",
          "الوسط": "60",
          "البطن": "45",
          "الارداف": "32",
          "الفخذ": "54",
          "الذراع": "30",
        },
      );

    case ProfileCards.diet:
      return PDFButton();

    case ProfileCards.personalData:
      return UserProfileGridView(
        profileContent: {
          "ID رقم": "#0025",
          "الاسم": "هاجر علي",
          "العمر": "30",
          "رقم الواتس": "01000002202",
          "الايميل": "hagerali@gmail.com"
        },
      );

    case ProfileCards.health:
      return UserProfileGridView(
        profileContent: {
          "اجراء عمليات جراحيه خلال سنه": "لا",
          "هل يوجد مشاكل صحيه": "لا",
        },
      );

    default:
      return const SizedBox.shrink(); // عنصر افتراضي فارغ
  }
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // المكتبه بتاعه inputFormatters
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController txtPhoneNumber = TextEditingController();
  TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: Container(
        padding: const EdgeInsets.fromLTRB(40, 70, 40, 0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/img/logo_img/login.png", height: 220, width: 220),
              TextField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(fontFamily: 'Tajawal'),
                keyboardType: TextInputType.phone,
                textAlign: TextAlign.right,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(11), // تحديد أقصى طول للنص
                  FilteringTextInputFormatter
                      .digitsOnly, // تصفية الإدخال للأرقام فقط
                ],
                decoration: const InputDecoration(
                  hintText: "رقم الهاتف",
                  prefixIcon:
                      Icon(Icons.phone_enabled, color: Colors.grey, size: 20),
                ),
                controller: txtPhoneNumber,
              ),
              const SizedBox(height: 20),
              TextField(
                textInputAction: TextInputAction.next,
                style: const TextStyle(fontFamily: 'Tajawal'),
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                textAlign: TextAlign.right,
                decoration: const InputDecoration(
                  hintText: "الرقم السري",
                  prefixIcon: Icon(Icons.lock, color: Colors.grey, size: 20),
                ),
                controller: txtPassword,
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/user_home');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(yellow),
                  minimumSize: WidgetStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width, // استخدام عرض الشاشة
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
                  "تسجيل الدخول",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(black),
                  minimumSize: WidgetStateProperty.all(
                    Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                  shape: WidgetStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                ),
                child: Text(
                  "استخدام التطبيق بدون تسجيل",
                  style: TextStyle(
                    color: Colors.grey.shade400,
                    fontSize: 16,
                    fontFamily: 'Tajawal',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

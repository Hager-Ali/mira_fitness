import 'package:flutter/material.dart';
import '../../constants.dart';

// enum traineeStatus{
//   active,
//   inactive
// }

class UserProfileGridView extends StatefulWidget {
  final Map<String, String> profileContent;
  final Widget? profileChild1;
  final Widget? profileChild2;

  UserProfileGridView({
    required this.profileContent,
    this.profileChild1,
    this.profileChild2,
  });

  @override
  State<UserProfileGridView> createState() => _ServicesState();
}

class _ServicesState extends State<UserProfileGridView> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2,
          childAspectRatio: 2.3,
          // mainAxisSpacing: 5,
          // crossAxisSpacing: 5,
          padding: EdgeInsets.zero,
          children: widget.profileContent.entries.map((entry) {
            // تحويل كل عنصر في الخريطة إلى Widget
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    entry.key, // يعرض كعنوان
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Tajawal",
                      color: Color.fromARGB(255, 128, 128, 128),
                    ),
                  ),
                  Text(
                    entry.value, // يعرض كمحتوى
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 14,
                      fontFamily: "Tajawal",
                      color: black,
                    ),
                  ),
                ],
              ),
            );
          }).toList(),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: widget.profileChild1,
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 10),
          child: widget.profileChild2,
        ),
      ],
    );
  }
}

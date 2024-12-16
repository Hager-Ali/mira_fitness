import 'package:flutter/material.dart';
import 'package:mira_fitness/constants.dart';

class UserProfileCards extends StatefulWidget {
  final String UserProfileCardIcon, UserProfileCardTitle;
  final VoidCallback onTap;
  final bool isActive;

  UserProfileCards(
      {required this.UserProfileCardIcon,
      required this.UserProfileCardTitle,
      required this.onTap,
      this.isActive= true
      });

  @override
  State<UserProfileCards> createState() => _UserProfileCardsState();
}

class _UserProfileCardsState extends State<UserProfileCards> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: widget.isActive ? Colors.transparent : Colors.grey.withOpacity(0.5),
            width: 1.0,
          ),
          boxShadow: widget.isActive? [
            const BoxShadow(
              color: Color.fromARGB(255, 238, 238, 238),
              spreadRadius: 3,
              blurRadius: 5,
              offset: Offset(0, 1),
            ),
          ] : []
          ,
        ),
        width: 200,
        height: 57,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.UserProfileCardIcon,
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            Text(
              widget.UserProfileCardTitle,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: "Tajawal",
                color: black,
              ),
            )
          ],
        ),
      ),
    );
  }
}

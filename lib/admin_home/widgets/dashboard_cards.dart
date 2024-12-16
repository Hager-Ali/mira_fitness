import 'package:flutter/material.dart';
import 'package:mira_fitness/constants.dart';

class DashboardCards extends StatefulWidget {

  final String DashboardCardIcon;
  final String DashboardCardTitle;
  final String DashboardCardValue;

  DashboardCards({
    required this.DashboardCardIcon,
    required this.DashboardCardTitle,
    required this.DashboardCardValue,
  });

  @override
  State<DashboardCards> createState() => _DashboardCardsState();
}

class _DashboardCardsState extends State<DashboardCards> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width - 56,
        height: 200,
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: lightGrey,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              widget.DashboardCardIcon,
              width: 55,
              height: 55,
              alignment: Alignment.center,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              widget.DashboardCardValue,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Tajawal",
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              widget.DashboardCardTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: "Tajawal",
                fontSize: 17,
                color: Color.fromARGB(255, 80, 80, 80)
              ),
            ),
          ],
        ),
      ),
    );
  }
}
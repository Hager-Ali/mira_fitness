import 'package:flutter/material.dart';
import '../../constants.dart';

import 'package:flutter_expanded_tile/flutter_expanded_tile.dart';

class Services extends StatefulWidget {
  final String serviceIcon, serviceTitle, serviceContent;
  Services({
    required this.serviceIcon,
    required this.serviceTitle,
    required this.serviceContent,
  });

  @override
  State<Services> createState() => _ServicesState();
}

class _ServicesState extends State<Services> {

  late ExpandedTileController _controller;

  @override
  void initState() {
    _controller = ExpandedTileController(isExpanded:false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: white,
        border: Border.all(
          color:
              Colors.grey.withOpacity(0.5), // اللون الرمادي مع تقليل الشفافية
          width: 1.0, // عرض البوردر
        ),
      ),
      child: ExpandedTile(
      theme: const ExpandedTileThemeData(
        contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        contentBackgroundColor: white,
      ),
      title: Text(
        widget.serviceTitle,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: "Tajawal",
          color: black,
        ),
      ),
      leading: Image.asset(
        widget.serviceIcon,
        alignment: AlignmentDirectional.centerStart,
        height: 33,
        width: 33,
        fit: BoxFit.cover,
      ),
      controller: _controller,
      content: Text(
        widget.serviceContent,
        style: const TextStyle(
          fontSize: 18,
          fontFamily: "Tajawal",
          color: black,
        ),
      ),
    ),
        
    );
  }
}


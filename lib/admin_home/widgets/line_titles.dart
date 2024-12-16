import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class LineTitles {
  static getTitleData() => FlTitlesData(
    show: true,
    bottomTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 1,
        reservedSize: 22,
        getTitlesWidget: (value, meta) {
          TextStyle style = const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          );
          switch (value.toInt()) {
            case 1:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Jan', style: style),
              );
            case 2:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Feb', style: style),
              );
            case 3:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Mar', style: style),
              );
            case 4:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Apr', style: style),
              );
            case 5:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('May', style: style),
              );
            case 6:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Jun', style: style),
              );
            case 7:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Jul', style: style),
              );
            case 8:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Aug', style: style),
              );
            case 9:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Sep', style: style),
              );
            case 10:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Oct', style: style),
              );
            case 11:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Nov', style: style),
              );
            case 12:
              return Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text('Dec', style: style),
              );
          }
          return const Text('');
        },
      ),
    ),
    leftTitles: AxisTitles(
      sideTitles: SideTitles(
        showTitles: true,
        interval: 1, // تعيين الفاصل بين القيم
        reservedSize: 23,
        getTitlesWidget: (value, meta) {
          TextStyle style = const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          );

          switch (value.toInt()) {
            case 1:
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('10', style: style),
              );
            case 2:
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('20', style: style),
              );
              case 3:
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('30', style: style),
              );
              case 4:
              return Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text('40', style: style),
              );
          }
          return const Text('');
        },
      ),
    ),
  );
}

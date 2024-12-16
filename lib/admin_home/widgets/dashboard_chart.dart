import 'package:flutter/material.dart';
import 'package:mira_fitness/constants.dart';
import 'package:mira_fitness/admin_home/widgets/line_titles.dart';

import 'package:fl_chart/fl_chart.dart';


class DashboardChart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.only(top: 15),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: 350,
          child: LineChart(
            LineChartData(
              minX: 0,
              maxX: 12,
              minY: 0,
              maxY: 5,
              titlesData: LineTitles.getTitleData(),
              gridData: FlGridData(
                  show: false,
                  // getDrawingHorizontalLine: (value) {
                  //   return FlLine(
                  //     color: lightGrey,
                  //     strokeWidth: 1,
                  //   );
                  // },
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: lightGrey, width: 1),
                  ),
              lineBarsData: [
                LineChartBarData(spots: [                
                  FlSpot(0, 2),
                  FlSpot(1.6, 2),
                  FlSpot(4.9, 4),
                  FlSpot(5, 2.5),
                  FlSpot(6, 2),
                  // FlSpot(1.6, 4),
                  // FlSpot(8, 4),
                  // FlSpot(9.6, 3),
                  // FlSpot(0, 4),
                  // FlSpot(1.6, 2.3),
                  // FlSpot(11, 4),
                  // FlSpot(1.2, 2.1),
                ],
                isCurved: true,
                // barWidth: 5,
                // dotData: FlDotData(
                //   show: false,
                // ),
                color: yellow,
                //  gradient: LinearGradient(
                //     colors: chartGradientColors,
                    // begin: Alignment.centerLeft,
                    // end: Alignment.centerRight,
                  // ),
                  belowBarData: BarAreaData(
                    show: true,
                    gradient: LinearGradient(
                      colors: chartGradientColors
                          .map((color) => color.withOpacity(0.3))
                          .toList(),
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    ),
                  )
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

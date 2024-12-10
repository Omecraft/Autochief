

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyPieChart extends StatelessWidget {
  final double easy;
  final double medium;
  final double hard;
  const MyPieChart({super.key, required this.easy, required this.medium, required this.hard});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: 200,
      child: PieChart(
        
        PieChartData(
          
          pieTouchData: PieTouchData(
              touchCallback: (FlTouchEvent event, pieTouchResponse) {
                // Filter only for tap-up events
                if (event is FlTapUpEvent && pieTouchResponse != null) {
                  Navigator.pushNamed(context, '/mealList');
              }
            },
          ),

          sections: [
            PieChartSectionData(
              borderSide: const BorderSide(color: Color(0xFFffb17a),width: 3),
              value: easy,
              color: Colors.green,
              title: ("Easy"),
              titleStyle: GoogleFonts.nunito(
                fontSize: 15,
                color: Colors.black,
                
              )
            ),
            PieChartSectionData(
              borderSide: const BorderSide(color: Color(0xFFffb17a),width: 3),
              value: medium,
              color: Colors.yellow,
              title: ("Mid"),
              titleStyle: GoogleFonts.nunito(
                fontSize: 15,
                color: Colors.black
              )
            ),
            PieChartSectionData(
              borderSide: const BorderSide(color: Color(0xFFffb17a),width: 3),
              value: hard,
              color: Colors.red,
              title: ("Hard"),
              titleStyle: GoogleFonts.nunito(
                fontSize: 15,
                color: Colors.black
              )
            )
          ]
        )
      ),
    );
  }
}
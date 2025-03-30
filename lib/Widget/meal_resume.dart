import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class MealResume extends StatefulWidget {
  const MealResume({Key? key}) : super(key: key);

  @override
  State<MealResume> createState() => _MealResumeState();
}

class _MealResumeState extends State<MealResume> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 200,
      decoration: BoxDecoration(
        color: const Color(0xFF424769),
        borderRadius: BorderRadius.circular(10), 
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text("45", style: TextStyle(fontSize: 35,color: Color(0xFFffb17a)),),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: const Text("Total meals", style: TextStyle(fontSize: 15,color: Color(0xFFffb17a)),),
                )
              ]
            ),
            const SizedBox(height: 5),
            SizedBox(
              height: 20,
              child: LineChart(
                LineChartData(
                  gridData: FlGridData(show: false),
                  titlesData: FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, 1),
                        FlSpot(3, 1),
                      ],
                      isCurved: false,
                      color: Colors.green,
                      barWidth: 8,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(3, 1),
                        FlSpot(6, 1),
                      ],
                      isCurved: false,
                      color: Colors.orangeAccent,
                      barWidth: 8,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                    LineChartBarData(
                      spots: [
                        FlSpot(6, 1),
                        FlSpot(9, 1),
                      ],
                      isCurved: false,
                      color: Colors.red,
                      barWidth: 8,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(show: false),
                    ),
                  ],
                  minX: 0,
                  maxX: 9,
                  minY: 0,
                  maxY: 2,
                ),
              ),
            ),
            
          ]
        ),
      )
    );
  }
}

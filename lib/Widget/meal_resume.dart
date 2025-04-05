import 'package:autochiefv2/Page/ListMealPage.dart';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:provider/provider.dart';

class MealResume extends StatefulWidget {
  const MealResume({Key? key}) : super(key: key);

  @override
  State<MealResume> createState() => _MealResumeState();
}

class _MealResumeState extends State<MealResume> {
  @override
  Widget build(BuildContext context) {
    // Access the meal database using Provider
    final mealDatabase = Provider.of<Mealdatabase>(context);
    
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const Listmealpage()));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.93,
        height: 120,
        decoration: BoxDecoration(
          color: const Color(0xFF333650),
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
                  Text(
                    "${mealDatabase.meals.length}", 
                    style: TextStyle(fontSize: 35, color: Color.fromARGB(255, 255, 255, 255)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: const Text("Total meals", style: TextStyle(fontSize: 15, color: Color.fromARGB(255, 255, 255, 255)),),
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
      ),
    );
  }
}

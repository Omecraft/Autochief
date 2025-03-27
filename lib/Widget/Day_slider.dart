import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class DaySlider extends StatefulWidget {
  const DaySlider({super.key});

  @override
  State<DaySlider> createState() => _DaySliderState();
}

class _DaySliderState extends State<DaySlider> {
  int _current = 0;
  final List<Map<String, String>> days = [
    {'day': 'Lundi', 'date': '01'},
    {'day': 'Mardi', 'date': '02'},
    {'day': 'Mercredi', 'date': '03'},
    {'day': 'Jeudi', 'date': '04'},
    {'day': 'Vendredi', 'date': '05'},
    {'day': 'Samedi', 'date': '06'},
    {'day': 'Dimanche', 'date': '07'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 100,
            
            viewportFraction: 0.8,
            enlargeCenterPage: true,
            onPageChanged: (index, reason) {
              setState(() {
                _current = index;
              });
            },
          ),
          items: days.map((day) => Container(
            margin: EdgeInsets.only(top: 10),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              color: const Color(0xFF424769),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  day['date']!,
                  style: const TextStyle(
                    color: Color(0xFFffb17a),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  day['day']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          )).toList(),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: days.asMap().entries.map((entry) {
            return Container(
              width: 12.0,
              height: 8.0,
              margin: const EdgeInsets.symmetric(
                vertical: 8.0, 
                horizontal: 4.0
              ),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _current == entry.key 
                    ? const Color(0xFFffb17a)
                    : Colors.grey,
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
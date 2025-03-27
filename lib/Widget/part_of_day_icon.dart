import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';

class PartOfDayIcon extends StatefulWidget {
  const PartOfDayIcon({super.key});

  @override
  State<PartOfDayIcon> createState() => _PartOfDayIconState();
}

class _PartOfDayIconState extends State<PartOfDayIcon> {

  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (selectedIndex == 0) ...[
          const Icon(
            Iconic.sun_solid,
            size: 30,
            color: Color(0xFFffb17a),
          ),
          const SizedBox(
            height: 10, 
          ),
          GestureDetector(
            onTap: () {
              onItemTapped(1);
            },
            child: const Icon(
              Iconic.moon,
              size: 30,
              color: Colors.grey,
            ), 
          ),
        ] else if (selectedIndex == 1) ...[
          GestureDetector(
            onTap: () {
              onItemTapped(0);
            },
            child: const Icon(
              Iconic.sun,
              size: 30,
              color: Colors.grey,
            ), 
          ),
          const SizedBox(
            height: 10,
          ),
          const Icon(
            Iconic.moon_solid,
            size: 30,
            color: Color(0xFFffb17a),
          ),
          
          
        ]
      ],
    );
  }
}
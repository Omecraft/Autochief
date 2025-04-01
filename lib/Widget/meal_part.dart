import 'package:flutter/material.dart';

class MealPart extends StatefulWidget {
  final String mealName;
  final String difficulty;
  const MealPart({
    Key? key,
    required this.mealName,
    required this.difficulty,
  }) : super(key: key);

  @override
  State<MealPart> createState() => _MealPartState();
}

class _MealPartState extends State<MealPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Color(0xFF333650),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              widget.mealName,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ), 
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Text(
              widget.difficulty,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ), 
          ) 
        ]
      ),
    ); 
  }
}

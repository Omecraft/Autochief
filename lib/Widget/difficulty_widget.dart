import 'package:flutter/material.dart';

class DifficultyWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  final int number;

  const DifficultyWidget({
    super.key,
    required this.icon,
    required this.color, 
    required this.text,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.28,
      height: MediaQuery.of(context).size.width * 0.3*1.5,
      decoration: BoxDecoration(
        color: const Color(0xFF333650),
        borderRadius: BorderRadius.circular(10),  
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: color,
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.all(8),
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            text,
            style: TextStyle(
              color: color,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '$number',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
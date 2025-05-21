import 'package:flutter/material.dart';
import 'package:autochiefv2/constants.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
      GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/addmeal');
        },
        child: Container(
          width: MediaQuery.of(context).size.width * 0.42,
          height: MediaQuery.of(context).size.width * 0.3,
          decoration: BoxDecoration(
            color: widgetcolor,
            borderRadius: BorderRadius.circular(10)
          ),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
             Icon(
              Icons.add_circle,
              size: 40,
              color: Color(0xFFffb17a),
              
             ),
             SizedBox(height: 10),
             Text(
              'ADD',
              style: TextStyle(
                color: Color.fromARGB(255, 253, 253, 253),
                fontSize: 20
              ),
             ) 
            ]
          ),
        ),
      ),
      Container(
        
        width: MediaQuery.of(context).size.width * 0.42,
        height: MediaQuery.of(context).size.width * 0.3,
        decoration: BoxDecoration(
          color: widgetcolor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
           Icon(
            Icons.live_help,
            size: 40,
            color: Color(0xFFffb17a),
           ),
           SizedBox(height: 10),
           Text(
            'HELP',
            style: TextStyle(
              color: Color.fromARGB(255, 255, 255, 255),
              fontSize: 20
            ),
           ) 
          ]
        ),
      )   
      ]
    );
  }
}
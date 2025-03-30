import 'package:autochiefv2/Widget/Day_slider.dart';
import 'package:autochiefv2/Widget/part_of_day_chooser.dart';
import 'package:autochiefv2/Widget/part_of_day_icon.dart';
import 'package:autochiefv2/Widget/todaymeal.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:autochiefv2/Data/mealdatabase.dart';


// ignore: must_be_immutable
class Weekmeal extends StatelessWidget {
  // ignore: non_constant_identifier_names
  List Meals;
  // ignore: non_constant_identifier_names
  Weekmeal({super.key, this.Meals = const []});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        /*if (!Mealdatabase().iscreated()) ...[
          // Your widgets will go here when database is not created
          const Text('Database is not created'),
        ],*/
        if (!Mealdatabase().iscreated())...[
          // Your widgets will go here when database is created
          Row( 
            children: [
              Container(
                
                height: 124,
                width: MediaQuery.of(context).size.width * 0.05, 
              ),
             Container(
              
              height: 124,
              width: MediaQuery.of(context).size.width * 0.7,
              child: DaySlider(),
             ),
             Container(
              
              height: 124,
              width: MediaQuery.of(context).size.width * 0.05, 
             ),
             
             PartOfDayIcon()
            ]
          ) 
        ]
      ],
    );
  }
}

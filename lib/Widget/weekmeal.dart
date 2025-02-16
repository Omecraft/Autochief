import 'package:autochiefv2/Widget/todaymeal.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

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
        const Todaymeal(day:"Lundi", lunch:0),
    
        // Utilisation d'un SizedBox pour spécifier une taille fixe pour ListView
        SizedBox(
          width: 100,
          height: 200,
          child: ListView(
            children: [
              TimelineTile(isFirst: true,),
              TimelineTile(),
              TimelineTile(isLast: true),
            ],
          ),
        )
      ],
    );
  }
}

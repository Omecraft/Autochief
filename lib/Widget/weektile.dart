import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class Weektile extends StatelessWidget {
  final String day;
  const Weektile({super.key,required this.day});

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      isFirst: day == "Lundi",
      isLast: day == "Dimanche",
    );
  }
}
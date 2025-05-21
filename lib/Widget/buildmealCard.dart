import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const MealCard({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool created=false;
    created=context.read<Mealdatabase>().iscreated();

    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF292D4D),
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: const Color(0xFFFFA665),
                    size: 20,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Choisir',
                  style: TextStyle(
                    color: Color(0xFFFFA665),
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if(created)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF1E2239),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child:
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Aucun plat sélectionnéééééééééééééééééé',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Cliquez pour choisir un plat',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          if(!created)
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color(0xFF1E2239),
              borderRadius: BorderRadius.circular(8),
            ),
            padding: const EdgeInsets.all(12),
            child:
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Votre emploi du temps des plats est vide',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Genere ton emploi du temps dans la rubrique emploi du temps',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
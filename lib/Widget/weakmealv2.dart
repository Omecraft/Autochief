import 'package:autochiefv2/Widget/buildmealCard.dart';
import 'package:flutter/material.dart';
import 'package:iconic/iconic.dart';
import 'package:iconly/iconly.dart';

class WeakMealV2 extends StatefulWidget {
  const WeakMealV2({super.key});

  @override
  State<WeakMealV2> createState() => _WeakMealV2State();
}

class _WeakMealV2State extends State<WeakMealV2> {
  int currentDayIndex = 3; // Jeudi par défaut
  final List<String> days = [
    'Lundi',
    'Mardi',
    'Mercredi',
    'Jeudi',
    'Vendredi',
    'Samedi',
    'Dimanche',
  ];

  void handlePrevDay() {
    setState(() {
      currentDayIndex = currentDayIndex > 0 ? currentDayIndex - 1 : 6;
    });
  }

  void handleNextDay() {
    setState(() {
      currentDayIndex = currentDayIndex < 6 ? currentDayIndex + 1 : 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFF1E2239),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Sélecteur de jour
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: handlePrevDay,
                    icon: const Icon(Icons.chevron_left, size: 24),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFF292D4D),
                      foregroundColor: const Color(0xFFFFA665),
                      padding: const EdgeInsets.all(12),
                      shape: const CircleBorder(),
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        '${(currentDayIndex + 1).toString().padLeft(2, '0')}',
                        style: const TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFA665),
                        ),
                      ),
                      Text(
                        days[currentDayIndex],
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: handleNextDay,
                    icon: const Icon(Icons.chevron_right, size: 24),
                    style: IconButton.styleFrom(
                      backgroundColor: const Color(0xFF292D4D),
                      foregroundColor: const Color(0xFFFFA665),
                      padding: const EdgeInsets.all(12),
                      shape: const CircleBorder(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              // Indicateurs de jour
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  days.length,
                  (index) => Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    width: 24,
                    height: 4,
                    decoration: BoxDecoration(
                      color: index == currentDayIndex
                          ? const Color(0xFFFFA665)
                          : const Color(0xFF292D4D),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Cartes de repas
          Column(
            children: [
              // Carte Déjeuner
              MealCard(
                icon: Iconic.sun,
                title: 'Déjeuner',
              ),
              const SizedBox(height: 16),
              // Carte Dîner
              MealCard(
                icon: Iconic.moon,
                title: 'Dîner',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
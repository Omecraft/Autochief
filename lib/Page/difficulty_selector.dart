import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

class DifficultySelector extends StatelessWidget {
  final String value;
  final Function(String) onChange;

  const DifficultySelector({
    Key? key,
    required this.value,
    required this.onChange,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final difficulties = [
      {
        'id': 'Easy',
        'label': 'Facile',
        'color': Colors.green.shade500,
      },
      {
        'id': 'Medium',
        'label': 'Moyen',
        'color': const Color(0xFFFFA665),
      },
      {
        'id': 'Hard',
        'label': 'Difficile',
        'color': Colors.red.shade500,
      },
    ];

    return Row(
      children: difficulties.map((difficulty) {
        final isSelected = value == difficulty['id'];
        final color = difficulty['color'] as Color;
        
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: ElevatedButton(
              onPressed: () => onChange(difficulty['id'] as String),
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? color : const Color(0xFF292D4D),
                foregroundColor: isSelected ? Colors.white : Colors.grey.shade300,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (isSelected) ...[
                    const Icon(LucideIcons.check, size: 16),
                    const SizedBox(width: 4),
                  ],
                  Text(difficulty['label'] as String),
                ],
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
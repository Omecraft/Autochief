import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../Data/data_ingredient.dart';
import 'ingredient.dart';

class IngredientCategory extends StatelessWidget {
  final String categoryName;
  final List<DataIngredient> ingredients;

  const IngredientCategory({
    super.key,
    required this.categoryName,
    required this.ingredients,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
          child: Text(
            categoryName,
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.white.withOpacity(0.9),
            ),
          ),
        ),
        SizedBox(
          height: 115,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: ingredients.length,
            itemBuilder: (context, index) {
              final ingredient = ingredients[index];
              return Ingredient(
                data: ingredient.name,
                image: ingredient.image,
                quantity: '${ingredient.quantity}${ingredient.unit}',
              );
            },
          ),
        ),
        const SizedBox(height: 24),
      ],
    );
  }
}
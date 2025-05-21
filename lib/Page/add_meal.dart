import 'package:autochiefv2/Data/datameal.dart';
import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:provider/provider.dart';
import 'difficulty_selector.dart';
import 'ingredient_selector.dart';

class AddMealPage extends StatefulWidget {
  final DataMeal? meal; // Optional meal parameter for editing
  const AddMealPage({Key? key, this.meal}) : super(key: key);

  @override
  State<AddMealPage> createState() => _AddMealPageState();
}

class _AddMealPageState extends State<AddMealPage> {
  final TextEditingController _dishNameController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  String _difficulty = 'medium';
  List<String> _selectedIngredients = [];
  bool _isEditing = false; // Flag to determine if we're editing or adding

  @override
  void initState() {
    super.initState();
    // Check if we're editing an existing meal
    if (widget.meal != null) {
      _isEditing = true;
      // Pre-fill the form with the meal data
      _dishNameController.text = widget.meal!.name;
      _descriptionController.text = widget.meal!.description;
      _difficulty = widget.meal!.difficulty;
      // If the meal has ingredients, add them to selected ingredients
      /*
      A modifier quand les ingredients seront crees
      
      if (widget.meal!.ingredients != null) {
        _selectedIngredients = widget.meal!.ingredients!.map((ing) => ing.name).toList();
      }
      */
    }
  }

  void _handleSubmit() {
    if (_isEditing) {
      // Update existing meal
      final updatedMeal = widget.meal!
        ..name = _dishNameController.text
        ..difficulty = _difficulty
        ..description = _descriptionController.text;
      
      // Update the meal in the database
      context.read<Mealdatabase>().updateMeal(updatedMeal);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Plat modifié avec succès!')),
      );
    } else {
      // Create a new meal
      context.read<Mealdatabase>().addMeal(DataMeal()
        ..name = _dishNameController.text
        ..difficulty = _difficulty
        ..image = 'default_meal_image.png' // Using a default image path
        ..description = _descriptionController.text);
      
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Plat ajouté avec succès!')),
      );
    }
    
    // Return to previous screen
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _dishNameController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF1E2239),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              padding: const EdgeInsets.all(16),
              color: const Color(0xFF1E2239),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(LucideIcons.arrowLeft, color: Color(0xFFFFA665)),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    _isEditing ? 'Modifier le plat' : 'Ajouter un plat',
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            
            // Form
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 500),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Name input
                      const Text(
                        'Nom du plat',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _dishNameController,
                        style: const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                          hintText: 'Entrez le nom du plat',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          filled: true,
                          fillColor: const Color(0xFF292D4D),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Description input
                      const Text(
                        'Description',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _descriptionController,
                        style: const TextStyle(color: Colors.white),
                        maxLines: 4,
                        decoration: InputDecoration(
                          hintText: 'Décrivez brièvement le plat',
                          hintStyle: TextStyle(color: Colors.grey.shade400),
                          filled: true,
                          fillColor: const Color(0xFF292D4D),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 16,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      
                      // Difficulty selector
                      const Text(
                        'Difficulté',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      DifficultySelector(
                        value: _difficulty,
                        onChange: (value) {
                          setState(() {
                            _difficulty = value;
                          });
                        },
                      ),
                      const SizedBox(height: 24),
                      
                      // Ingredients selector
                      const Text(
                        'Ingrédients',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 8),
                      IngredientSelector(
                        selectedIngredients: _selectedIngredients,
                        setSelectedIngredients: (ingredients) {
                          setState(() {
                            _selectedIngredients = ingredients;
                          });
                        },
                      ),
                      const SizedBox(height: 12),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: _selectedIngredients.map((ingredient) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF323559),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  ingredient,
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      _selectedIngredients = _selectedIngredients
                                          .where((i) => i != ingredient)
                                          .toList();
                                    });
                                  },
                                  child: const Icon(
                                    Icons.close,
                                    size: 16,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                      const SizedBox(height: 32),
                      
                      // Submit button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFFFA665),
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(_isEditing ? LucideIcons.save : LucideIcons.plus, size: 20),
                              const SizedBox(width: 8),
                              Text(
                                _isEditing ? 'Modifier le plat' : 'Ajouter le plat',
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';


class Ingredient {
  final String id;
  final String name;
  final int quantity;
  final String unit;
  final String imageUrl;

  Ingredient({
    required this.id,
    required this.name,
    required this.quantity,
    required this.unit,
    required this.imageUrl,
  });
}

class Category {
  final String id;
  final String name;
  final List<Ingredient> ingredients;

  Category({
    required this.id,
    required this.name,
    required this.ingredients,
  });
}

class FridgePage extends StatefulWidget {
  const FridgePage({super.key});

  @override
  State<FridgePage> createState() => _FridgePageState();
}

class _FridgePageState extends State<FridgePage> {
  String searchTerm = '';
  List<Category> categories = [
    Category(
      id: 'fruits',
      name: 'Fruits',
      ingredients: [
        Ingredient(
          id: 'apple',
          name: 'Pommes',
          quantity: 5,
          unit: '',
          imageUrl:
              'https://images.unsplash.com/photo-1570913149827-d2ac84ab3f9a?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
        Ingredient(
          id: 'banana',
          name: 'Bananes',
          quantity: 3,
          unit: '',
          imageUrl:
              'https://images.unsplash.com/photo-1543218024-57a70143c369?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
        Ingredient(
          id: 'orange',
          name: 'Oranges',
          quantity: 4,
          unit: '',
          imageUrl:
              'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
        Ingredient(
          id: 'orange',
          name: 'Oranges',
          quantity: 4,
          unit: '',
          imageUrl:
              'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
        Ingredient(
          id: 'orange',
          name: 'Oranges',
          quantity: 4,
          unit: '',
          imageUrl:
              'https://images.unsplash.com/photo-1582979512210-99b6a53386f9?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
      ],
    ),
    Category(
      id: 'vegetables',
      name: 'Légumes',
      ingredients: [
        Ingredient(
          id: 'carrot',
          name: 'Carottes',
          quantity: 8,
          unit: '',
          imageUrl:
              'https://images.unsplash.com/photo-1598170845058-32b9d6a5da37?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
        Ingredient(
          id: 'tomato',
          name: 'Tomates',
          quantity: 6,
          unit: '',
          imageUrl:
              'https://images.unsplash.com/photo-1561136594-7f68413baa99?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
        Ingredient(
          id: 'cucumber',
          name: 'Concombres',
          quantity: 2,
          unit: '',
          imageUrl:
              'https://images.unsplash.com/photo-1604977042946-1eecc30f269e?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
      ],
    ),
    Category(
      id: 'dairy',
      name: 'Produits Laitiers',
      ingredients: [
        Ingredient(
          id: 'milk',
          name: 'Lait',
          quantity: 1,
          unit: 'L',
          imageUrl:
              'https://images.unsplash.com/photo-1563636619-e9143da7973b?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
        Ingredient(
          id: 'cheese',
          name: 'Fromage',
          quantity: 200,
          unit: 'g',
          imageUrl:
              'https://images.unsplash.com/photo-1589881133595-a3c085cb731d?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
        Ingredient(
          id: 'yogurt',
          name: 'Yaourt',
          quantity: 4,
          unit: '',
          imageUrl:
              'https://images.unsplash.com/photo-1584278860047-22db9ff82bed?ixlib=rb-1.2.1&auto=format&fit=crop&w=100&q=80',
        ),
      ],
    ),
  ];

  /// Returns a filtered list of categories based on the search term
  /// Only includes categories that have ingredients matching the search
  List<Category> get filteredCategories {
    return categories
        .map((category) => Category(
              id: category.id,
              name: category.name,
              // Filter ingredients whose names contain the search term
              ingredients: category.ingredients
                  .where((ingredient) => ingredient.name
                      .toLowerCase()
                      .contains(searchTerm.toLowerCase()))
                  .toList(),
            ))
        // Only keep categories that still have ingredients after filtering
        .where((category) => category.ingredients.isNotEmpty)
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: const Color(0xFF1e2132).withOpacity(0.9),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Row(
                  children: [            
                    const SizedBox(width: 16),
                    Text(
                      'Mon Frigo',
                      style: GoogleFonts.nunito(
                        fontSize: 24,
                        color: Colors.white,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFF2a2e42),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    onChanged: (value) => setState(() => searchTerm = value),
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                      hintText: 'Rechercher...',
                      hintStyle: TextStyle(color: Colors.grey),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.grey,
                        size: 22,
                      ),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 0,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(24),
              itemCount: filteredCategories.length + 1, // +1 pour l'espace supplémentaire
              itemBuilder: (context, index) {
                // Si c'est le dernier index, retourner un SizedBox pour l'espace
                if (index == filteredCategories.length) {
                  return const SizedBox(height: 100); // Espace pour dépasser le FAB
                }
                
                final category = filteredCategories[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      category.name,
                      style: GoogleFonts.nunito(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      height: 2,
                      decoration: BoxDecoration(
                        color: primaryColor,
                        boxShadow: [
                          BoxShadow(
                            color: primaryColor.withOpacity(0.3),
                            blurRadius: 1,
                            offset: const Offset(1, 2),
                          ),
                        ],
                      ),
                    ),
                    
                    GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        childAspectRatio: 0.75,
                      ),
                      itemCount: category.ingredients.length,
                      itemBuilder: (context, i) {
                        final ingredient = category.ingredients[i];
                        return Container(
                          decoration: BoxDecoration(
                            color: widgetcolor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  ingredient.imageUrl,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                ingredient.name,
                                style: GoogleFonts.nunito(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(height: 4),
                              Text(
                                '${ingredient.quantity}${ingredient.unit}',
                                style: GoogleFonts.nunito(
                                  fontSize: 12,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    
                  ],
                );
              },
            ),
          ),
          
        ],
      ),
      
    );
  }
}
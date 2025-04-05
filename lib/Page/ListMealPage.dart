import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:autochiefv2/Widget/meal_part.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Listmealpage extends StatefulWidget {
  final int initialClicked;
  
  const Listmealpage({super.key, this.initialClicked = -1});

  @override
  State<Listmealpage> createState() => _ListmealpageState();
}

class _ListmealpageState extends State<Listmealpage> {
  late int clicked; // Commencer avec la valeur passée en paramètre
  String searchQuery = ""; // Ajouter une variable pour stocker le texte de recherche

  @override
  void initState() {
    super.initState();
    // Initialiser clicked avec la valeur passée au widget
    clicked = widget.initialClicked;
    // Charger les plats au démarrage
    context.read<Mealdatabase>().readmeals();
  }

  void updateClicked(int index) {
    setState(() {
      clicked = clicked == index ? -1 : index;
    });
  }

  // Fonction pour filtrer les plats selon la difficulté et le texte de recherche
  List filterMeals(List meals) {
    // Filtrer d'abord par difficulté
    List difficultyFiltered = meals;
    if (clicked != -1) {
      String difficulty;
      if (clicked == 0) difficulty = "Easy";
      else if (clicked == 1) difficulty = "Medium";
      else difficulty = "Hard"; // Assurez-vous que cela correspond à votre modèle de données
      
      difficultyFiltered = meals.where((meal) => meal.difficulty == difficulty).toList();
    }
    
    // Ensuite filtrer par texte de recherche si non vide
    if (searchQuery.trim().isEmpty) {
      return difficultyFiltered;
    }
    
    // Recherche insensible à la casse
    String query = searchQuery.toLowerCase();
    return difficultyFiltered.where((meal) => 
      meal.name.toLowerCase().contains(query) || 
      meal.description.toLowerCase().contains(query)
    ).toList();
  }

  @override
  Widget build(BuildContext context) {
    // Observer les changements dans la liste des plats
    List meals = context.watch<Mealdatabase>().meals;
    List filteredMeals = filterMeals(meals);
    
    return Scaffold(
      backgroundColor: const Color(0xFF242739),
      floatingActionButton: GestureDetector(
        onTap: () {
          Navigator.pushNamed(context, '/addmeal');
        },
        child: Container(
          width: 80,
          height: 80,
          decoration: const BoxDecoration(
            color: Color(0xFFffb17a),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.add,
            color: Color(0xFF242739),
            size: 40,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            const SizedBox(height: 40,),
            TextField(
              style: const TextStyle(color: Color(0xFFffb17a), fontSize: 25),
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFF333650),
                hintStyle: const TextStyle(color: CupertinoColors.inactiveGray),
                hintText: "Search meals",
                prefixIcon: const Icon(Icons.search, color: CupertinoColors.inactiveGray,),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                )
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),    
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => updateClicked(0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: clicked == 0 ? const Color(0xFFffb17a) : const Color(0xFF333650),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Easy',
                      style: TextStyle(
                        fontSize: 25,
                        color: clicked == 0 ? const Color(0xFF242739) : const Color(0xFFffb17a),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => updateClicked(1),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: clicked == 1 ? const Color(0xFFffb17a) : const Color(0xFF333650),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Medium', 
                      style: TextStyle(
                        fontSize: 25,
                        color: clicked == 1 ? const Color(0xFF242739) : const Color(0xFFffb17a),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => updateClicked(2),
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: clicked == 2 ? const Color(0xFFffb17a) : const Color(0xFF333650),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      'Difficult',
                      style: TextStyle(
                        fontSize: 25,
                        color: clicked == 2 ? const Color(0xFF242739) : const Color(0xFFffb17a),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            
            // Remplacer les MealPart statiques par un ListView dynamique
            Expanded(
              child: filteredMeals.isEmpty 
                ? const Center(child: Text('No meals found', style: TextStyle(color: Color(0xFFffb17a), fontSize: 20)))
                : ListView.builder(
                    itemCount: filteredMeals.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: MealPart(
                          meal: filteredMeals[index],
                          mealName: filteredMeals[index].name,
                          difficulty: filteredMeals[index].difficulty,
                          description: filteredMeals[index].description,
                          onDelete: () {
                            // Force refresh of the meal list
                            setState(() {
                              // This will trigger a rebuild with the updated meal list
                              context.read<Mealdatabase>().readmeals();
                            });
                          },
                        ),
                      );
                    },
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
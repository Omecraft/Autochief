import 'package:autochiefv2/Widget/meal_part.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listmealpage extends StatefulWidget {
  const Listmealpage({super.key});

  @override
  State<Listmealpage> createState() => _ListmealpageState();
}

class _ListmealpageState extends State<Listmealpage> {
  int clicked = 0;

  void updateClicked(int index) {
    setState(() {
      clicked = index;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              style: TextStyle(color: Color(0xFFffb17a),fontSize: 25),
              decoration: InputDecoration(
                filled: true,
                fillColor: Color(0xFF333650),
                hintStyle: TextStyle(color: CupertinoColors.inactiveGray),
                hintText: "Search meals",
                prefixIcon: Icon(Icons.search, color: CupertinoColors.inactiveGray,),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)
                )
              ),    
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
            MealPart(mealName: "Spaghetti",difficulty: "Easy",),
          ]
        ),
      ),
    );
  }
}
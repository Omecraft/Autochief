import 'package:autochiefv2/Data/datameal.dart';
import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:custom_sliding_segmented_control/custom_sliding_segmented_control.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Addmeal extends StatelessWidget {
  Addmeal({super.key});

  //Text controller for the meal name
  final TextEditingController mealname = TextEditingController();

  //Text controller for the meal difficulty
  late String mealdifficulty;

  //Text controller for the meal ingredients
  final TextEditingController mealingredients = TextEditingController();

  //Text controller for the meal instructions
  final TextEditingController mealdescription = TextEditingController();


  //Create a new meal
  void addmeal(BuildContext context, DataMeal meal) {
    //Add meal to the database
    context.read<Mealdatabase>().addMeal(meal);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2d3250),
      appBar: AppBar(
        leading: IconButton(
          color: const Color(0xFFffb17a),
          style: ButtonStyle(
            shadowColor: WidgetStateProperty.all<Color>(const Color(0xFFffb17a)),
            
          ),
          icon: const Icon(Icons.arrow_back_outlined,
                     shadows: [
                      Shadow(
              blurRadius: 5.0,
              color: Color(0xFFffb17a),
              offset: Offset(1, 0.7),
            ),
                     ],
                     size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF2d3250),
        title: Text('Add Meal', style: GoogleFonts.nunito(
          fontSize: 30,
          color: const Color(0xFFffb17a),
          shadows: [
            const Shadow(
              blurRadius: 5.0,
              color: Color(0xFFffb17a),
              offset: Offset(0.0, 0.0),
            ),
          ]
        ),),
        
      
    ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            
            Container(
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFffb17a),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: mealname,
                  decoration: const InputDecoration(
                  hintText: 'Meal Name',
                  hintStyle: TextStyle(
                    color: Color(0xFFffb17a),
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  ),
                  style: GoogleFonts.nunito(
                  color: const Color(0xFFffb17a),
                  fontSize: 20,
                  ),
                ),
              ),
            ),
            CustomSlidingSegmentedControl(
              children:{
                "Easy": Text("Easy",style: GoogleFonts.nunito(
                  fontSize: 20,
                  color: Colors.green,
                ),),
                "Medium": Text("Medium",style: GoogleFonts.nunito(
                  fontSize: 20,
                  color: Colors.orange,
                ),),
                "Hard": Text("Hard",style: GoogleFonts.nunito(
                  fontSize: 20,
                  color: Colors.red,
                ),),
              },
              thumbDecoration: BoxDecoration(
                color: const Color(0xFF676f9d),
                borderRadius: BorderRadius.circular(5),
              ),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                
                color: const Color(0xFF2d3250),
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: const Color(0xFFffb17a),
                ),
              ),
              onValueChanged: (v) {
              mealdifficulty=v;
            }),
            TextField(
              controller: mealingredients,
              decoration: const InputDecoration(
                hintText: 'Meal Ingredients',
                hintStyle: TextStyle(
                  color: Color(0xFFffb17a),
                  fontSize: 20,
                ),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFffb17a),
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xFFffb17a),
                  ),
                ),
              ),
              style: GoogleFonts.nunito(
                color: const Color(0xFFffb17a),
                fontSize: 20,
              ),
            ),
            Container(
              height: 300,
              margin: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xFFffb17a),
                ),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: mealname,
                  decoration: const InputDecoration(
                  hintText: 'Meal Name',
                  hintStyle: TextStyle(
                    color: Color(0xFFffb17a),
                    fontSize: 20,
                  ),
                  border: InputBorder.none,
                  ),
                  style: GoogleFonts.nunito(
                  color: const Color(0xFFffb17a),
                  fontSize: 20,
                  ),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<Mealdatabase>().addMeal(DataMeal()
                    ..name = mealname.text
                    ..difficulty = mealdifficulty
                    ..description = mealingredients.text
                    ..description = mealdescription.text);
                Navigator.pop(context);
                
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFFffb17a)),
                shadowColor: WidgetStateProperty.all<Color>(const Color(0xFFffb17a)),
                elevation: WidgetStateProperty.all<double>(5),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: const Text('Add Meal'),
            ),
            ElevatedButton(
              onPressed: () {
                print(mealdifficulty);
                
              },
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFFffb17a)),
                shadowColor: WidgetStateProperty.all<Color>(const Color(0xFFffb17a)),
                elevation: WidgetStateProperty.all<double>(5),
                shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                ),
              ),
              child: const Text('Test'),
            ),
          ],
        ),
      ),
    );
  }
}
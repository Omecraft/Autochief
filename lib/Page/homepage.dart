
import 'package:autochiefv2/Widget/bottom_widget.dart';
import 'package:autochiefv2/Widget/difficulty_widget.dart';
import 'package:autochiefv2/Widget/featuredmealbis.dart';
import 'package:autochiefv2/Widget/meal_resume.dart';
import 'package:autochiefv2/Widget/mealviewhome.dart';
import 'package:autochiefv2/Widget/weakmealv2.dart';
import 'package:autochiefv2/Widget/weekmeal.dart';
import 'package:autochiefv2/Page/ListMealPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: secondarybackgroundColor,
      title:  Text('AutoChief',style: titlestyle),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          icon: const Icon(Icons.person_rounded, color: Color(0xFFffb17a), size: 30),
        )
      ],
    ),
    backgroundColor: const Color(0xFF1E2239),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           children: [
         
         
            // Weakmeal Part
            Text("Meal of the week", style: titlestyle,),
            
            WeakMealV2(),
            
         
         
         
            const SizedBox(height: 20),
            Center(child: Text("Featured meal", style: titlestyle,),),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              children: [
                
                Featuredmealbis(image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg",data: "Burger",difficulty: "Easy",),
                Featuredmealbis(image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg",data: "Burger",difficulty: "Easy",)
                
         
              ],
            )),
            
            const SizedBox(height: 20),
            Center(child: Text("Meal resume", style: titlestyle,),),
            const MealResume(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const Listmealpage(initialClicked: 0))
                    );
                  },
                  child: const DifficultyWidget(icon: Icons.check, color: Color(0xFF639e72), text: "Easy meals"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const Listmealpage(initialClicked: 1))
                    );
                  },
                  child: const DifficultyWidget(icon: Icons.remove, color: Color(0xFFeaa546), text: "Medium meals"),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context, 
                      MaterialPageRoute(builder: (context) => const Listmealpage(initialClicked: 2))
                    );
                  },
                  child: const DifficultyWidget(icon: Icons.close, color: Color(0xFFd35649), text: "Difficult meals"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const BottomWidget(),
         
            const SizedBox(height: 200),
           ],
         ),
       ),
     ),
    );
  }
} // Closing brace for class HomePage

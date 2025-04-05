
import 'package:autochiefv2/Widget/bottom_widget.dart';
import 'package:autochiefv2/Widget/difficulty_widget.dart';
import 'package:autochiefv2/Widget/featuredmealbis.dart';
import 'package:autochiefv2/Widget/meal_resume.dart';
import 'package:autochiefv2/Widget/mealviewhome.dart';
import 'package:autochiefv2/Widget/weekmeal.dart';
import 'package:autochiefv2/Page/ListMealPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(
      backgroundColor: const Color(0xFF2d3250),
      title: const Text('AutoChief',style: TextStyle(
        color: Color(0xFFffb17a),
        fontSize: 30,
        fontWeight: FontWeight.bold,
        shadows: [
          Shadow(
            blurRadius: 5.0,
            color: Color(0xFFffb17a),
            offset: Offset(0.0, 0.0),
          ),
        ]
      ),),
      actions: [
        IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/profile');
          },
          icon: const Icon(Icons.person_rounded, color: Color(0xFFffb17a), size: 30),
        )
      ],
    ),
    backgroundColor: const Color(0xFF242739),
     body: SingleChildScrollView(
       child: Padding(
         padding: const EdgeInsets.all(20.0),
         child: Column(
           children: [
         
         
            // Weakmeal Part
            Text("Meal of the week", style: GoogleFonts.nunito(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  shadows: [
                    const Shadow(
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      offset: Offset(0.0, 0.0),
                    ),
                  ]
                  ),),
            Weekmeal(),
         
         
         
            const SizedBox(height: 20),
            Center(child: Text("Featured meal", style: GoogleFonts.nunito(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  shadows: [
                    const Shadow(
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      offset: Offset(0.0, 0.0),
                    ),
                  ]
                  ),),),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
              children: [
                
                Featuredmealbis(image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg",data: "Burger",difficulty: "Easy",),
                Featuredmealbis(image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg",data: "Burger",difficulty: "Easy",)
                
         
              ],
            )),
            
            const SizedBox(height: 20),
            Center(child: Text("Meal resume", style: GoogleFonts.nunito(
                  fontSize: 20,
                  color: const Color.fromARGB(255, 255, 255, 255),
                  fontWeight: FontWeight.bold,
                  shadows: [
                    const Shadow(
                      blurRadius: 2.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      offset: Offset(0.0, 0.0),
                    ),
                  ]
                  ),),),
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

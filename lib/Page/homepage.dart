
import 'package:autochiefv2/Widget/pie_chart.dart';
import 'package:autochiefv2/Widget/featuredmeal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: const Color(0xFF2d3250),
     body: Column(
       children: [
        Padding(
           padding: const EdgeInsets.only(top: 100),
           child: Center(
             child: Text('AutoChief',style: GoogleFonts.nunito(
              fontSize: 40,
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
         ),
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
            Featuredmeal(name: "Burger", image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg", difficulty: "Easy",color: Colors.green),
            Featuredmeal(name: "Ravioli", image:"https://sf2.viepratique.fr/wp-content/uploads/sites/2/2014/06/pate-raviolis.jpg", difficulty: "Medium",color: Colors.yellow),
            Featuredmeal(name: "Burger", image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg", difficulty: "Easy",color: Colors.green),
            Featuredmeal(name: "Burger", image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg", difficulty: "Easy",color: Colors.green),
            Featuredmeal(name: "Burger", image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg", difficulty: "Easy",color: Colors.green),
            Featuredmeal(name: "Burger", image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg", difficulty: "Easy",color: Colors.green),
            Featuredmeal(name: "Burger", image:"https://resize.elle.fr/original/var/plain_site/storage/images/elle-a-table/les-dossiers-de-la-redaction/dossier-de-la-redac/hamburger-maison/94060671-1-fre-FR/Comment-preparer-le-meilleur-hamburger-maison-du-monde.jpg", difficulty: "Easy",color: Colors.green),

          ],
        )),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 225,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(0xFF424769),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Column(
                  children: [
                    SizedBox(height: 15),
                    Text("Your meals", style: TextStyle(
                      fontSize: 20,
                      color: Color.fromARGB(255, 255, 255, 255),
                      fontWeight: FontWeight.bold,
                      shadows: [
                        Shadow(
                          blurRadius: 2.0,
                          color: Color.fromARGB(255, 255, 255, 255),
                          offset: Offset(0.0, 0.0),
                        ),
                      ]
                      ),),
                      SizedBox(height: 5),
                    MyPieChart(easy: 20, medium: 64, hard: 10)
                  ],
                ),
              ),
            ),
            const SizedBox(width: 20),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF424769),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 130,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          children: [
                            Text("ADD A", style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  offset: Offset(0.0, 0.0),
                                ),
                              ]
                              ),),
                              Text("MEAL", style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  offset: Offset(0.0, 0.0),
                                ),
                              ]
                              ),),
                          ],
                        ),
                        
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, '/addmeal');
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(bottom:8.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: const Color(0xFF676f9d),
                                border: Border.all(color: const Color(0xFFffb17a), width: 2),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: const Icon(Icons.add_rounded, color: Color(0xFFffb17a), size: 60)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFF424769),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    height: 105,
                    width: 125,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          children: [
                            Text("FAQ", style: TextStyle(
                              fontSize: 20,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontWeight: FontWeight.bold,
                              shadows: [
                                Shadow(
                                  blurRadius: 2.0,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                  offset: Offset(0.0, 0.0),
                                ),
                              ]
                              ),),
                          ],
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.only(bottom:8.0),
                          child: Container(
                            decoration: BoxDecoration(
                              color: const Color(0xFF676f9d),
                              border: Border.all(color: const Color(0xFFffb17a), width: 2),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const Icon(Icons.help_rounded, color: Color(0xFFffb17a), size: 60)),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        )
       ],
     ),
     
    );
    
  }
}
import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:autochiefv2/Widget/seemore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Mealviewhome extends StatelessWidget {
  const Mealviewhome({super.key});

  @override
  Widget build(BuildContext context) {
    return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 200,
                height: 250,
                decoration: BoxDecoration(
                  color: const Color(0xFF424769),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FutureBuilder<String>(
                      future: context.read<Mealdatabase>().difcounter("Easy"),
                      builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
      // Affiche un indicateur de chargement pendant que les données sont en cours de récupération
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
      // Affiche un message d'erreur en cas de problème
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
      // Affiche les données une fois récupérées
                            return Text('Easy Meals: ${snapshot.data}',style: GoogleFonts.nunito(
                                color: Colors.green,
                                fontSize: 25,
                                shadows: [
                                  const Shadow(
                                    blurRadius: 1.0,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    offset: Offset(0.0, 0.0),
                                    ),
                                ]
                            ),);
                        } else {
                          return const Text('No data');
            }
    },
),

                    FutureBuilder<String>(
                      future: context.read<Mealdatabase>().difcounter("Medium"),
                      builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
      // Affiche un indicateur de chargement pendant que les données sont en cours de récupération
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
      // Affiche un message d'erreur en cas de problème
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
      // Affiche les données une fois récupérées
                            return Text('Easy Meals: ${snapshot.data}',style: GoogleFonts.nunito(
                                color: Colors.orange,
                                fontSize: 25,
                                shadows: [
                                  const Shadow(
                                    blurRadius: 1.0,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    offset: Offset(0.0, 0.0),
                                    ),
                                ]
                            ),);
                        } else {
                          return const Text('No data');
            }
    },
),
                    FutureBuilder<String>(
                      future: context.read<Mealdatabase>().difcounter("Hard"),
                      builder: (context, snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
      // Affiche un indicateur de chargement pendant que les données sont en cours de récupération
                            return const CircularProgressIndicator();
                          } else if (snapshot.hasError) {
      // Affiche un message d'erreur en cas de problème
                            return Text('Error: ${snapshot.error}');
                          } else if (snapshot.hasData) {
      // Affiche les données une fois récupérées
                            return Text('Easy Meals: ${snapshot.data}',style: GoogleFonts.nunito(
                                color: Colors.red,
                                fontSize: 25,
                                shadows: [
                                  const Shadow(
                                    blurRadius: 1.0,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    offset: Offset(0.0, 0.0),
                                    ),
                                ]
                            ),);
                        } else {
                          return const Text('No data');
            }
    },
),
                    const seemore(text:"View meals",route: "/mealList",)
                  ],
                ),
              ),
            );
  }
}
// ignore: unused_import
import 'dart:ffi';

import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:autochiefv2/Widget/seemore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:provider/provider.dart';

class Todaymeal extends StatelessWidget {
  final String day;
  final int lunch;
  const Todaymeal({super.key,required this.day,required this.lunch});
  @override
  

  Widget build(BuildContext context) {

    List currentweek = context.watch<Mealdatabase>().weekmeals;
    final bool created = context.watch<Mealdatabase>().iscreated();


    if (!created) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 200,
          width: 200,
          child: Text(
            "The week has not been created yet!",
            style: GoogleFonts.nunito(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.red,
            ),
          ),
        ),
      ),
    );
  }
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 300,
        width: 200,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // Bordures arrondies
              child: Image.network(
                currentweek[lunch].image, // Remplace par ton URL
                width: 200, // Largeur personnalisée
                height: 200, // Hauteur personnalisée
                fit: BoxFit.cover, // L'image sera coupée pour remplir les dimensions
              ),
            ),
            Positioned(top: 10, right: 10, 
            child: Container(decoration:BoxDecoration(
              border: const Border(
                top: BorderSide(color: Color(0xFFffb17a), width: 2),
                bottom: BorderSide(color: Color(0xFFffb17a), width: 2),
                left: BorderSide(color: Color(0xFFffb17a), width: 2),
                right: BorderSide(color: Color(0xFFffb17a), width: 2),
              ),
              borderRadius: BorderRadius.circular(90),),
            
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(IconlyLight.heart,color: Color(0xFFffb17a),),
            ))),
            Positioned(bottom: 100,child: Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text(currentweek[lunch].difficulty,style: GoogleFonts.nunito(
                color: const Color(0xFFffb17a),
                fontSize: 15,
                shadows: [
                    const Shadow(
                      blurRadius: 1.0,
                      color: Colors.black,
                      offset: Offset(0.0, 0.0),
                    ),
                  ]
              ),),
            ),),
            Positioned(bottom: 65,child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(currentweek[lunch].name,style: GoogleFonts.nunito(
                color: const Color(0xFFffb17a),
                fontWeight: FontWeight.bold,
                
                fontSize: 25,
                shadows: [
                    const Shadow(
                      blurRadius: 1.0,
                      color: Colors.black,
                      offset: Offset(0.0, 0.0),
                    ),
                  ]
              ),),
            ),),
            const Positioned(bottom: 0,child: seemore(text: "See more",route:"/week" ,),)
            ]
        ),
            
      ),
    );

  }
}
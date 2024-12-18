import 'package:autochiefv2/Widget/slidable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class Featuredmealbis extends StatelessWidget {
  final String data;
  final String image;
  final String difficulty;
  const Featuredmealbis({super.key,required this.image,required this.data,required this.difficulty});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        width: 200,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16), // Bordures arrondies
              child: Image.network(
                image, // Remplace par ton URL
                width: 200, // Largeur personnalisée
                height: 300, // Hauteur personnalisée
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
              child: Text(difficulty,style: GoogleFonts.nunito(
                color: Color(0xFFffb17a),
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
              child: Text(data,style: GoogleFonts.nunito(
                color: Color(0xFFffb17a),
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
            const Positioned(child: seemore(),bottom: 0,)
            ]
        ),
            
      ),
    );

  }
}
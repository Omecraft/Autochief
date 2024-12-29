import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';

class Ingredient extends StatelessWidget {
  final String data;
  final String image;
  final String quantity;
  const Ingredient({super.key,required this.image,required this.data,required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 115,
        width: 150,
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
            Positioned(top: 7.5, right: 7.5, 
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(IconlyLight.plus,color: Color(0xFFffb17a),),
            )),
            Positioned(bottom: 40,child: Padding(
              padding: const EdgeInsets.only(left:10.0),
              child: Text(quantity,style: GoogleFonts.nunito(
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
            Positioned(bottom: 10,child: Padding(
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
            
            ]
        ),
            
      ),
    );

  }
}
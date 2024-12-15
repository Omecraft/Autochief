import 'package:autochiefv2/Widget/slidable.dart';
import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';

class Featuredmealbis extends StatelessWidget {
  final String image;
  const Featuredmealbis({super.key,required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              top: BorderSide(color: Colors.white, width: 2),
              bottom: BorderSide(color: Colors.white, width: 2),
              left: BorderSide(color: Colors.white, width: 2),
              right: BorderSide(color: Colors.white, width: 2),
            ),
            borderRadius: BorderRadius.circular(90),),
          
          child: const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(IconlyLight.heart,color: Colors.white,),
          ))),
          
          const Positioned(child: Slidable(),bottom: 0,)
          ]
      ),
          
    );

  }
}
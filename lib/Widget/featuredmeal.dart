import 'package:autochiefv2/Page/Recipe.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Featuredmeal extends StatelessWidget {
  final String name;
  final String image;
  final String difficulty;
  final Color color;
  const Featuredmeal({super.key,required this.name,required this.image,required this.difficulty,required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 200,
      height: 250,
      decoration: BoxDecoration(
        
        borderRadius: BorderRadius.circular(20),
        color: const Color(0xFF424769),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF676f9d).withOpacity(0.4),
            spreadRadius: 0.5,
            blurRadius: 4,
            offset: const Offset(4, 2),
          ),
        ],
      ),
      margin: const EdgeInsets.all(10),
      
      padding: const EdgeInsets.only(top:10.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(name,style: GoogleFonts.nunito(
                color: Colors.white,
                fontSize: 15,
                shadows: [
                    const Shadow(
                      blurRadius: 1.0,
                      color: Color.fromARGB(255, 255, 255, 255),
                      offset: Offset(0.0, 0.0),
                    ),
                  ]
                ),),
              Text(difficulty,style: GoogleFonts.nunito(
                color: color,
                fontSize: 15,
                shadows: [
                    Shadow(
                      blurRadius: 1.0,
                      color: color,
                      offset: const Offset(0.0, 0.0),
                    ),
                  ]
                ),),
            ],
          ),
          const SizedBox(height: 10),
          Container(
            width: 190,
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, 
              MaterialPageRoute(builder: (context) => Recipe(name: name))
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFffb17a),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: Text("View Recipe",style: GoogleFonts.nunito(
                color: const Color(0xFF2d3250),
                fontSize: 15,
                shadows: [
                    const Shadow(
                      blurRadius: 1.0,
                      color: Color(0xFF2d3250),
                      offset: Offset(0.0, 0.0),
                    ),
                  ]
                ),),
          ),
        ],
      ),
    );
  }
}
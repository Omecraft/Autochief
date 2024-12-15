import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:slidable_button/slidable_button.dart';

class Slidable extends StatelessWidget {
  const Slidable({super.key});

  @override
  Widget build(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        
      ),
      height: 50,
      child: Stack(
        children: [
        // Background blur effect
        ClipRRect(
          borderRadius: BorderRadius.circular(40),
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
            child: Container(
              width: 180,
              height: 50,
              color: Colors.black.withOpacity(0.1),
            ),
          ),
        ),
        // Slidable button
        Center(
          child: Container(
            width: 180,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Stack(
                children: [
                  Center(child: Text("See more",style: GoogleFonts.nunito(
                    color: Colors.white,
                    fontSize: 15,
                    shadows: [
                        Shadow(
                          blurRadius: 1.0,
                          color: Colors.white,
                          offset: const Offset(0.0, 0.0),
                        ),
                      ]
                  ),),),
                  Positioned(
                    right: 0,
                    
                    child: Padding(
                      padding: EdgeInsets.only(top: 2.5),
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(90),
                          color: Colors.white,
                        ),
                        child: Icon(Icons.arrow_forward_ios_rounded)),
                    )
                  ),
                ],
              )
            ),
          )
        ),
        ],
      ),
    ),
  );
  }
}
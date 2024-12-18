import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconly/iconly.dart';
import 'package:slidable_button/slidable_button.dart';

class seemore extends StatelessWidget {
  
  const seemore({super.key,});

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
              color: const Color(0xFFffb17a).withOpacity(0.2),
            ),
          ),
        ),
        
        Center(
          child: Row(
            children: [
              SizedBox(
                width: 180,
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Stack(
                    children: [
                      Center(child: Text("See more",style: GoogleFonts.nunito(
                        color: Color(0xFFffb17a),
                        fontSize: 15,
                        shadows: [
                            
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
                              color: Color(0xFF676f9d),
                            ),
                            child: Icon(Icons.arrow_forward_ios_rounded,color: Color(0xFFffb17a),)),
                        )
                      ),
                    ],
                  )
                ),
              ),
            ],
          )
        ),
        ],
      ),
    ),
  );
  }
}
import 'package:autochiefv2/Widget/Fridgepart.dart';
import 'package:autochiefv2/Widget/fridgepartrow.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fridge extends StatelessWidget {
  const Fridge({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2d3250),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
             padding: const EdgeInsets.only(top: 100),
             child: Center(
               child: Text('Fridge',style: GoogleFonts.nunito(
                fontSize: 40,
                color: const Color.fromARGB(255, 255, 255, 255),
                shadows: [
                  const Shadow(
                    blurRadius: 5.0,
                    color: Color.fromARGB(255, 255, 255, 255),
                    offset: Offset(0.0, 0.0),
                  ),
                ]
                ),),
             ),
           ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Fridgepart(namecategory: "Fruit"),
          ),
          const Fridgepartrow(name1: "Juice", name2: "Spices")
           
          ],
        ),
      ),
    );
  }
}
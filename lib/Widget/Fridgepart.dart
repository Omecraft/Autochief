import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fridgepart extends StatelessWidget {
  final String namecategory;

  const Fridgepart({super.key, required this.namecategory});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: const Color(0xFF676f9d),
        borderRadius: BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(namecategory, style: GoogleFonts.nunito(
              fontSize: 20,
              color: const Color.fromARGB(255, 255, 255, 255),
              shadows: [
                const Shadow(
                  blurRadius: 2.0,
                  color: Color.fromARGB(255, 255, 255, 255),
                  offset: Offset(0.0, 0.0),
                ),
              ]
            ),),
          ),
          Container(
            height: 1,
            
            decoration: const BoxDecoration(
              color:  Color(0xFFffb17a),
              boxShadow: [
                BoxShadow(
                  blurRadius: 2.0,
                  color: Color(0xFFffb17a),
                  offset: Offset(0, 0.0),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
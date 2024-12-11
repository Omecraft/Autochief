import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Fridgepartrow extends StatelessWidget {
  final String name1;
  final String name2;

  const Fridgepartrow({super.key, required this.name1, required this.name2});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF676f9d),
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(25),
                  bottomLeft: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(name1, style: GoogleFonts.nunito(
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
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: const Color(0xFF676f9d),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(name2, style: GoogleFonts.nunito(
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
            ),
          ),
        ),
      ],
    );
  }
}
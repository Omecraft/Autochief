import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../constants.dart';

class DifficultyWidget extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;
  

  const DifficultyWidget({
    super.key,
    required this.icon,
    required this.color, 
    required this.text,
    
  });
  
  @override
  Widget build(BuildContext context) {
    String dif = "";
    if (text == "Difficult meals"){
      dif="Hard";
    }
    if (text == "Medium meals"){
      dif="Medium";
    }
    if (text == "Easy meals"){
      dif="Easy";
    }

    // Force initial read of meals when widget is built
    context.read<Mealdatabase>().readmeals();

    return Consumer<Mealdatabase>(
      builder: (context, mealDb, child) => Container(
        width: MediaQuery.of(context).size.width * 0.28,
        height: MediaQuery.of(context).size.width * 0.3*1.5,
        decoration: BoxDecoration(
          color: widgetcolor,
          borderRadius: BorderRadius.circular(10),  
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              padding: const EdgeInsets.all(8),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            FutureBuilder<String>(
              future: mealDb.difcounter(dif),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else if (snapshot.hasData) {
                  return Text(
                    snapshot.data!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 34,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                } else {
                  return const Text('0');
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
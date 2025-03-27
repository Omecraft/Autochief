
import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Calendar extends StatelessWidget {

  const Calendar({super.key});


  @override
  Widget build(BuildContext context) {

    void handleCreateWeek(BuildContext context) async {
      print("in create week");
  bool success = await context.read<Mealdatabase>().createweek();
  
  if (!success) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Erreur'),
          content: const Text('Il n\'y a pas assez de plats dans la base de données (minimum 14 requis).'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  } else {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Succès'),
          content: const Text('La semaine a été créée avec succès.'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        );
      },
    );
  }
}
    return Scaffold(
      backgroundColor: const Color(0xFF2d3250),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          OutlinedButton(onPressed:() {handleCreateWeek(context);} ,  child: const Text("data")),
          const Center(
            child: Text('Calendar'),
          ),
        ],
      ),
    );
  }
}
import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class MealList extends StatefulWidget {
  const MealList({super.key});

  @override
  State<MealList> createState() => _MealListState();
}

class _MealListState extends State<MealList> {
  
  @override
  void initState() {
    super.initState();
    context.read<Mealdatabase>().readmeals();
  }
    
  void printallmeals() {
    context.read<Mealdatabase>().printmeals();
  }
  @override
  Widget build(BuildContext context) {
    
    List currentmeal = context.watch<Mealdatabase>().meals;

    return Scaffold(
      backgroundColor: const Color(0xFF2d3250),
      appBar: AppBar(
        leading: IconButton(
          color: const Color(0xFFffb17a),
          style: ButtonStyle(
            shadowColor: WidgetStateProperty.all<Color>(const Color(0xFFffb17a)),
            
          ),
          icon: const Icon(Icons.arrow_back_outlined,
                     shadows: [
                      Shadow(
              blurRadius: 5.0,
              color: Color(0xFFffb17a),
              offset: Offset(1, 0.7),
            ),
                     ],
                     size: 30,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        backgroundColor: const Color(0xFF2d3250),
        title: Text('Meal List', style: GoogleFonts.nunito(
          fontSize: 30,
          color: const Color(0xFFffb17a),
          shadows: [
            const Shadow(
              blurRadius: 5.0,
              color: Color(0xFFffb17a),
              offset: Offset(0.0, 0.0),
            ),
          ]
        ),),
        bottom: PreferredSize(
     preferredSize: const Size.fromHeight(4.0),
     child: Container(
        color: const Color(0xFFffb17a),
        height: 4.0,
     )),
      ),
      body: Column(
        children: [
              ElevatedButton(
                onPressed: () {
                  printallmeals();
                  
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(const Color(0xFFffb17a)),
                  shadowColor: WidgetStateProperty.all<Color>(const Color(0xFFffb17a)),
                  elevation: WidgetStateProperty.all<double>(5),
                  shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                  ),
                ),
                child: const Text('Add Meal'),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: currentmeal.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(currentmeal[index].name, style: GoogleFonts.nunito(
                        fontSize: 20,
                        color: const Color(0xFFffb17a),
                        shadows: [
                          const Shadow(
                            blurRadius: 5.0,
                            color: Color(0xFFffb17a),
                            offset: Offset(0.0, 0.0),
                          ),
                        ]
                      ),),
                      subtitle: Text(currentmeal[index].description, style: GoogleFonts.nunito(
                        fontSize: 15,
                        color: const Color(0xFFffb17a),
                        shadows: [
                          const Shadow(
                            blurRadius: 5.0,
                            color: Color(0xFFffb17a),
                            offset: Offset(0.0, 0.0),
                          ),
                        ]
                      ),),
                      //leading: Image.network(currentmeal[index].image),
                      trailing: IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () {
                          context.read<Mealdatabase>().deleteMeal(currentmeal[index]);
                        },
                      ),

                      
                    );
                  },
                ),
              )     
                      ],
      ),
    );
  }
}
import 'package:autochiefv2/Data/datameal.dart';
import 'package:autochiefv2/Data/mealdatabase.dart'; // Add this import
import 'package:flutter/material.dart';

class MealPart extends StatefulWidget {
  final DataMeal meal;
  final String mealName;
  final String difficulty;
  final String description; // Ajout du paramètre description
  final Function? onDelete; // Add callback function
  
  const MealPart({
    Key? key,
    required this.meal,
    required this.mealName,
    required this.difficulty,
    this.description = '', // Valeur par défaut vide
    this.onDelete, // Initialize the callback
  }) : super(key: key);

  @override
  State<MealPart> createState() => _MealPartState();
}

class _MealPartState extends State<MealPart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF333650),
        borderRadius: BorderRadius.circular(20), // Increased radius for more rounded corners
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Theme(
        data: Theme.of(context).copyWith(
          dividerColor: Colors.transparent,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
        ),
        child: ExpansionTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          collapsedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.mealName,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              Text(
                widget.difficulty,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          collapsedIconColor: Colors.white,
          iconColor: Colors.white,
          backgroundColor: Color(0xFF333650),
          collapsedBackgroundColor: Color(0xFF333650),
          tilePadding: EdgeInsets.symmetric(horizontal: 20),
          childrenPadding: EdgeInsets.all(16),
          children: [
            Text(
              widget.description.isNotEmpty 
                ? widget.description 
                : 'No description available',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Color(0xFFffb17a),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.edit, color: Color(0xFF242739)),
                      SizedBox(width: 8),
                      Text(
                        'Modify',
                        style: TextStyle(
                          fontSize: 20,
                          color: Color(0xFF242739),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            backgroundColor: Color(0xFF333650),
                            title: Text(
                              'CONFIRM DELETION',
                              style: TextStyle(color: Colors.white),
                            ),
                            content: Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Text(
                                'Are you sure you want to delete ${widget.mealName}?',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                            actionsPadding: EdgeInsets.all(16),
                            actions: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    decoration: BoxDecoration(
                                      color: Color(0xFFffb17a),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: InkWell(
                                      onTap: () => Navigator.of(context).pop(),
                                      child: Row(
                                        children: [
                                          Icon(Icons.cancel, color: Color(0xFF242739)),
                                          SizedBox(width: 8),
                                          Text(
                                            'Cancel',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Color(0xFF242739),
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  GestureDetector(
                                    onTap: () async {
                                      // Implement delete logic using Mealdatabase
                                      await Mealdatabase().deleteMeal(widget.meal);
                                      Navigator.of(context).pop();
                                      
                                      // Call the callback function if it exists
                                      if (widget.onDelete != null) {
                                        widget.onDelete!();
                                      }
                                      
                                      // Local state update
                                      setState(() {
                                        // State updated after meal deletion
                                      });
                                    },
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                      decoration: BoxDecoration(
                                        color: Colors.red,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Row(
                                        children: [
                                          const Icon(Icons.check_circle, color: Colors.white),
                                          const SizedBox(width: 8),
                                          const Text(
                                            'Confirm',
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 10),
                            ],
                          );
                        },
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.delete, color: Colors.white),
                        SizedBox(width: 8),
                        Text(
                          'Delete',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    ); 
  }
}

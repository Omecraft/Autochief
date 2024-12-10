import 'package:autochiefv2/Data/datameal.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Mealdatabase extends ChangeNotifier{

  // Instance de la base de données
  static late Isar isar;

  // Creation de la base de données
  static Future<void> init() async {
    
    final dir = await getApplicationDocumentsDirectory();
    // ignore: unused_local_variable
    isar = await Isar.open(
      [DataMealSchema],
      directory: dir.path);
      for (var i = 0; i < 200; i++) {
        print("init");
        }
      }
  
  // Liste des plats
  final List<DataMeal> meals = [];

  // Ajout d'un plat
  Future<void> addMeal(DataMeal meal) async {
    // Creation du plat a ajouter
    final newMeal = DataMeal()
      ..name = meal.name
      ..image = meal.image
      ..difficulty = meal.difficulty
      ..description = meal.description;


    // OPERARATION DE BASE //


    // Ajout du plat dans la base de données
    await isar.writeTxn(
      () async{
        await isar.dataMeals.put(newMeal);
      });
    
    // re-read from db
    readmeals();}

  // Lecture des plats
  Future<void> readmeals() async {
    // Recupération des plats dans la base de données
    final recupedmeals = await isar.dataMeals.where().findAll();

    // Mise a jour de la liste des plats
    meals.clear();
    meals.addAll(recupedmeals);

    // Notification des listeners(Widgets qui l'affichent)(C'est comme un setState)
    notifyListeners();

    
    }

  // Modification d'un plat
  Future<void> updateMeal(DataMeal meal) async {
    // Recuperation du plat a modifier
    final mealtoUpdate = await isar.dataMeals.get(meal.id);
    if(mealtoUpdate != null){
      // Modification du plat
      mealtoUpdate.name = meal.name;
      mealtoUpdate.image = meal.image;
      mealtoUpdate.difficulty = meal.difficulty;
      mealtoUpdate.description = meal.description;

      // Mise a jour du plat dans la base de données
      await isar.writeTxn(
        () async{
          await isar.dataMeals.put(mealtoUpdate);
          await readmeals();
        });
    }}

  // Suppression d'un plat
  Future<void> deleteMeal(DataMeal meal) async {
    // Suppression du plat dans la base de données
    await isar.writeTxn(
      () async{
        await isar.dataMeals.delete(meal.id);
        await readmeals();
      });
  }
  Future<void> printmeals() async {
    for (var meal in meals) {
      print('Meal: ${meal.name}, Description: ${meal.description}');
    }
    print("in");
  }
}
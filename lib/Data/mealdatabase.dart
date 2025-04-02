import 'package:autochiefv2/Data/data_ingredient.dart';
import 'package:autochiefv2/Data/datameal.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:math';

class Mealdatabase extends ChangeNotifier{

  // Instance de la base de données
  static late Isar isar;

  // Creation de la base de données
  static Future<void> init() async {
    
    final dir = await getApplicationDocumentsDirectory();
    // ignore: unused_local_variable
    isar = await Isar.open(
      [DataMealSchema, DataIngredientSchema],
      directory: dir.path);
      for (var i = 0; i < 200; i++) {
        }
      }
  
  // Liste des plats
  final List<DataMeal> meals = [];
  final List<List<DataMeal>> weekmeals = [];
  bool created = false;

  // Creer un emploi du temps
  Future createweek() async {
  // Vérifier qu'il y a au moins 14 plats dans la liste meals
  if (meals.length < 14) {
    return false;
  }

  // Créer une liste temporaire pour éviter de modifier la liste originale
  final List<DataMeal> shuffledMeals = List.from(meals);
  shuffledMeals.shuffle(Random());

  // Réinitialiser weekmeals au cas où il a déjà été rempli
  weekmeals.clear();

  // Répartir 14 plats en 7 jours, avec 2 plats par jour
  for (int i = 0; i < 7; i++) {
    weekmeals.add(shuffledMeals.sublist(i * 2, i * 2 + 2));
  }

  created = true;

  // Notification des listeners pour mettre à jour l'interface utilisateur
  notifyListeners();
  return true;
}

  bool iscreated(){
    return created;
  }
  // Ajout d'un plat
  Future<void> addMeal(DataMeal meal) async {
    // Creation du plat a ajouter
    final newMeal = DataMeal()
      ..name = meal.name
      ..image = meal.image
      ..difficulty = meal.difficulty
      ..description = meal.description
      ..ingredients = [];


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
    // ignore: unused_local_variable
    for (var meal in meals) {
    }
    print("in");
  }
  Future<String> difcounter(difficulty) async {
    int counter = 0;
    for (var meal in meals) {
      if (meal.difficulty == difficulty) {
        counter++;
      }
    }
    return counter.toString();

  }

  final List<DataIngredient> ingredients = [];
    
    Future<void> readingredients() async {
    // Recupération des plats dans la base de données
    final recupedingredients = await isar.dataIngredients.where().findAll();

    // Mise a jour de la liste des plats
    ingredients.clear();
    ingredients.addAll(recupedingredients);

    // Notification des listeners(Widgets qui l'affichent)(C'est comme un setState)
    notifyListeners();
    }
    Future<void> addIngredient(DataIngredient ingredient) async {
    // Creation du plat a ajouter
    final newIngredient = DataIngredient()
      ..name = ingredient.name
      ..image = ingredient.image
      ..category = ingredient.category
      ..unit = ingredient.unit
      ..quantity = ingredient.quantity;

    await isar.writeTxn(
      () async{
        await isar.dataIngredients.put(newIngredient);
      });
    }
    Future<void> deleteIngredient(DataIngredient ingredient) async {
    await isar.writeTxn(
      () async{
        await isar.dataIngredients.delete(ingredient.id);
      });
    }
}

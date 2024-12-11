import 'package:isar/isar.dart';

part 'data_ingredient.g.dart';

@Collection()
class DataIngredient {
  Id id = Isar.autoIncrement;

  late String name;
  late String image;
  late String category;
  late String unit;
  late int quantity;
  }
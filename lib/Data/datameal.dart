
import 'package:isar/isar.dart';

part 'datameal.g.dart';

@Collection()
class DataMeal {
  Id id = Isar.autoIncrement;

  late String name;
  late String image;
  late String difficulty;
  late String description;
  late List<String> ingredients; 
  

}

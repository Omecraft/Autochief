
import 'package:autochiefv2/Data/mealdatabase.dart';
import 'package:autochiefv2/Page/ListMealPage.dart';
import 'package:autochiefv2/Page/add_meal.dart';
import 'package:autochiefv2/deprecated/addmeal.dart';
import 'package:autochiefv2/Page/crysnav.dart';
import 'package:autochiefv2/Page/fridge.dart';
import 'package:autochiefv2/Page/homepage.dart';
import 'package:autochiefv2/deprecated/Deprecated_meallist.dart';
import 'package:autochiefv2/Page/profile.dart';
import 'package:autochiefv2/Page/week.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:autochiefv2/Page/fridgepage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Mealdatabase.init();

  final mealDb = Mealdatabase();
  await mealDb.readmeals(); // Ensure initial data is loaded

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => mealDb),
      ],
      child: const MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List _pages = [
    const HomePage(),
    const FridgePage(),
    const Calendar(),
    const Profile(),
  ];

  int selectedindex = 0;

  void indexchange(int i) {
    setState(() {
      selectedindex = i;
    });
  }
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            _pages[selectedindex],
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CrysNavBar(selectab: selectedindex, indexchange: indexchange),),
          ],
        ),
      ),
      routes: {
        '/home': (context) => const HomePage(),
        '/week': (context) => const Calendar(),
        '/profile': (context) => const Profile(),
        '/fridge': (context) => const FridgePage(),
        '/mealList': (context) => const MealList(),
        '/addmeal': (context) => AddMealPage(),
        '/listmealpage': (context) => const Listmealpage(), // Add this line
        
      },
      
    );
  }
}


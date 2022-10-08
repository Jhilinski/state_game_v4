import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '/views/page_one.dart';
import 'views/correct.dart';
import 'views/all_correct.dart';
import 'views/wrong.dart';
import 'views/start.dart';

void main() async {
  //initialize Hive
  await Hive.initFlutter();

  // open the box
  var box = await Hive.openBox('myBox');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => const StartPage(),
        '/page_one': (context) => const PageOne(),
        '/correct': (context) => CorrectPage(),
        '/all_correct': (context) => AllCorrectPage(),
        '/wrong': (context) => WrongPage(),
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blue,
      ),
      //onGenerateRoute: route.controller,
      //initialRoute: route.pageOne,
    );
  }
}
//© 2022 SimCon All Rights Reserved
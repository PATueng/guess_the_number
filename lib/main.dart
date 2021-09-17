import 'package:flutter/material.dart';

// import 'package:guess_the_number/pages/MidExam/pages_olympic.dart';
// import 'package:guess_the_number/pages/game/game_20_defeated.dart';
// import 'package:guess_the_number/pages/game/game_20_defeated_ver_column.dart';
// import 'package:guess_the_number/pages/game/game_20_lose.dart';
// import 'package:guess_the_number/pages/game/game_page.dart';
// import 'package:guess_the_number/pages/game/game_page1.dart';
import 'package:guess_the_number/pages/game1to100/game_page_1.dart';
// import 'package:guess_the_number/pages/homework8/thai_fonts_viewer.dart';
// import 'package:guess_the_number/pages/lcokscreen/lockscreen_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GamePage(),
    );
  }
}

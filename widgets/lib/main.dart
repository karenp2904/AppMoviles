import 'package:flutter/material.dart';
import 'package:widgets/info_card.dart';
import 'package:widgets/listView.dart';
import 'package:widgets/nav_bar.dart';
import 'package:widgets/mainPage.dart';
import 'package:widgets/search_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'PRACTICA',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyMain(),
    );
  }
}

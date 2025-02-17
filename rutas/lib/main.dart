import 'package:flutter/material.dart';
import 'package:rutas/view1.dart';
import 'package:rutas/view2.dart';
import 'package:get/get.dart';

void main() {
    runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false, 
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RUTAS',
      theme: ThemeData(
      ),
      initialRoute: '/',
      routes: {
          '/': (context) => const View1(),
          '/vista2': (context) => const View2(parametro: 'Hola'),

      },

    );
  }
}

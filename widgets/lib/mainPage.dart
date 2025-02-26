import 'package:flutter/material.dart';
import 'package:widgets/info_card.dart';
import 'package:widgets/moreWidgets.dart';
import 'package:widgets/nav_bar.dart';

class MyMain extends StatelessWidget {
  const MyMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: Text("Ejemplo de InfoCard")),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, 
          children: [
            /*
            InfoCard(
              title: 'Título de la Tarjeta',
              description: 'Este es un ejemplo de una tarjeta con información.',
              icon: Icons.info,
            ),*/
          ]
          
      )
      ),
      bottomNavigationBar: CustomBottomNavBar(), // Aquí está el truco
      backgroundColor: Colors.cyan,
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: Icon(Icons.add),
        ),
    );
  }
}

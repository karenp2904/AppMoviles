import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:  Text('MI HOME PAGEE')),
      body: Container(
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(20),
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 135, 201, 234)),
        child: Container(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    child: Text('K'),
                  ),
                  SizedBox(width: 40,),
                  Text('KAREN PEREZ',
                    textAlign: TextAlign.center, 
                    style: TextStyle(color: Colors.indigo,
                    fontSize: 25,
                    ),
                  ),
                ],
              ),
              Container(
                child: Image.network(
                  'https://via.placeholder.com/200', // Imagen de prueba
                  fit: BoxFit.cover,
                  ),
                height: 200,
                width: 200,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(onPressed: (){}, 
                    child: Text('Like', 
                    style: TextStyle( 
                       color: Colors.blueGrey
                      )
                      )
                    ),
                    TextButton(onPressed: (){}, 
                    child: Text('Comments')
                    ),
                    TextButton(onPressed: (){}, 
                    child: Text('Shared')
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 18, 49, 63),
    );
  }
}
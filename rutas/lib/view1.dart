import 'package:flutter/material.dart';
import 'package:rutas/view2.dart';
import 'package:rutas/view3.dart';
import 'package:get/get.dart';

class View1 extends StatelessWidget {
  const View1({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View1'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const View2(parametro: 'Hola')),
                  );
                  //Navigator.pushNamed(context, '/vista2');
                },
                child: const Text('Go to Vista2'),
                style: ElevatedButton.styleFrom(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 215, 133, 160)
                ),
              ),
              ElevatedButton(
                onPressed: () async {
                final respuesta = await Get.to(() => const View3());
                // Mostrar la respuesta recibida en un SnackBar
                if (respuesta != null) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Respuesta recibida: $respuesta')),
                  );
                }
              },
              child: const Text('Go to Vista3'),
              style: ElevatedButton.styleFrom(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 215, 133, 160)
                ),
              )
          ],
        )
         
        
      ),
    );
  }
}

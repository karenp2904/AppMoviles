import 'package:flutter/material.dart';

class View2 extends StatelessWidget {
  final String parametro;

  const View2({Key? key, required this.parametro}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista 2'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            
          children: <Widget>[
            Text('PARAMETRO: $parametro'),

            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
            child: const Text('Go to Vista1'),
            style: ElevatedButton.styleFrom(
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: const Color.fromARGB(255, 215, 133, 160)
                ),
            ),
          ],
        )
        
      ),
    );
  }
}

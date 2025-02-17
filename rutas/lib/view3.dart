import 'package:flutter/material.dart';
import 'package:get/get.dart';

class View3 extends StatelessWidget {
  const View3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Vista 3'),
        backgroundColor: Colors.pink,
      ),
      body: Center(

        child: ElevatedButton( 
          onPressed: () {
            Get.back(result: 'Mundo');
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
      ),
    );
  }
}

import 'package:flutter/material.dart';

class ListVieww extends StatefulWidget {
  const ListVieww({ Key? key }) : super(key: key);

  @override
  _PruebaState createState() => _PruebaState();
}

class _PruebaState extends State<ListVieww> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('HOLA')),
      body: 
      ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Elemento $index'),
          );
        },
      ),
    );
  }
 
}
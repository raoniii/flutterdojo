import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text('Tranfer New'),

),

  floatingActionButton: FloatingActionButton(
    onPressed: () {
      // Add your onPressed code here!
    },
    backgroundColor: Colors.blueGrey,
    child: const Icon(Icons.add),
  ),
)
)
);

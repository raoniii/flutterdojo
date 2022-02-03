import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  home: Scaffold(
    appBar: AppBar(title: Text('Transfer23'),

),

  floatingActionButton: FloatingActionButton(
    onPressed: () {
      // Add your onPressed code here!
    },
    backgroundColor: Colors.green,
    child: const Icon(Icons.add),
  ),
)
)
);

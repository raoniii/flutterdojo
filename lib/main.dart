import 'package:flutter/material.dart';
import 'package:mobile/models/contact.dart';

import 'package:mobile/viewer/login/dashboard.dart';


void main() => runApp(BytebankApp());


class BytebankApp extends StatelessWidget {
  const BytebankApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      home: Dashboard(),
    );
  }
}

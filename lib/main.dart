import 'package:cat_api/presentation/screen/catbreedlist_screen.dart';
import 'package:cat_api/presentation/screen/image_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(CatApiApp());
}

class CatApiApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat API',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatBreedsScreen(),
    );
  }
}

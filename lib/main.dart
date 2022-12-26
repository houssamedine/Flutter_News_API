import 'package:flutter/material.dart';
import 'package:my_first_app/screen/home_page.dart';

void main() {
  runApp(const OrangeValleyApp());
}

class OrangeValleyApp extends StatelessWidget {
  const OrangeValleyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

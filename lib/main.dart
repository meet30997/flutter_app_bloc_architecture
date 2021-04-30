import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_architecure/di/injection_container.dart' as di;
import 'package:flutter_app_bloc_architecure/features/cat_facts/presentation/pages/cat_facts_page.dart';

void main() {
  di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cat Facts',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CatFactsPage(),
    );
  }
}

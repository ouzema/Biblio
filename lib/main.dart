import 'package:bibliotheca/models/categorie.dart';
import 'package:bibliotheca/models/database/dao.dart';
import 'package:bibliotheca/views/home_page.dart';
import 'package:flutter/material.dart';

void main() async {
  // WidgetsFlutterBinding.ensureInitialized();

  runApp(
    MaterialApp(
      title: "Bibliotheca",
      theme: ThemeData(primaryColor: Colors.blue),
      home: const HomePage(),
    ),
  );
}

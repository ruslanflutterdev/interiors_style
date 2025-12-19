import 'package:flutter/material.dart';
import 'home_page.dart';

void main() {
  runApp(const InteriorStylesApp());
}

class InteriorStylesApp extends StatelessWidget {
  const InteriorStylesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Стили интерьера', // Название приложения
      theme: ThemeData(primarySwatch: Colors.blue), //Основная цветовая тема
      home: HomePage(), // Указываем что первыый экран будет HomePage
    );
  }
}

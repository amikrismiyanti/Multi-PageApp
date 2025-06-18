import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/detail_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi Edukasi Amii',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.teal.shade700,
        scaffoldBackgroundColor: Colors.teal.shade50,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.teal.shade700,
          foregroundColor: Colors.white,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal.shade700,
            foregroundColor: Colors.white,
          ),
        ),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.indigo.shade900),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/detail': (context) => DetailPage(),
      },
    );
  }
}

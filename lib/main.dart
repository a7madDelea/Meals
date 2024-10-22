import 'package:flutter/material.dart';

import 'screens/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meals Application',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'PlaywriteGBS',
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: const Color.fromARGB(255, 132, 0, 51),
        ),
      ),
      home: const TabsScreen(),
    );
  }
}

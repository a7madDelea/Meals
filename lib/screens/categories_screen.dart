import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text('Pick your category'),
      ),
      body: const Center(
        child: Text('Categories Screen'),
      ),
    );
  }
}

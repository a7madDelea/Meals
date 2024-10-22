import 'package:flutter/material.dart';

import '../models/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen({super.key, required this.meal});

  final MealModel meal;

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Meal Details Screen'),
      ),
    );
  }
}

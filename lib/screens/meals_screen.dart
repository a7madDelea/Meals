import 'package:flutter/material.dart';

import '../models/meal_model.dart';
import '../widgets/meal_item.dart';
import 'meal_details_screen.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({
    super.key,
    this.title,
    required this.meals,
  });

  final String? title;
  final List<MealModel> meals;
  @override
  Widget build(BuildContext context) {
    return title != null
        ? Scaffold(
            appBar: AppBar(
              title: Text(title!),
            ),
            body: mealScreen(context),
          )
        : mealScreen(context);
  }

  SingleChildScrollView mealScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: meals
            .map(
              (meal) => MealItem(
                meal: meal,
                onSelectMeal: (meal) => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (ctx) => MealDetailsScreen(meal: meal),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

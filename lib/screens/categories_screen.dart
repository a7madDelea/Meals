import 'package:flutter/material.dart';
import 'package:meals/data/categories_data.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';
import '../widgets/category_grid_item.dart';
import 'meals_screen.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.onToggleFavorite, required this.availableMeals,});

  final void Function(MealModel meal) onToggleFavorite;
  final List<MealModel> availableMeals;

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
        childAspectRatio: 3 / 2,
      ),
      children: [
        for (CategoryModel category in categoriesData)
          CategoryGridItem(
            category: category,
            availableMeals: availableMeals,
            onSelectCategory: (category) {
              final List<MealModel> filteredMeals = availableMeals
                  .where(
                    (meal) => meal.categories.contains(category.id),
                  )
                  .toList();
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => MealsScreen(
                    title: category.title,
                    meals: filteredMeals,
                    onToggleFavorite: onToggleFavorite,
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}

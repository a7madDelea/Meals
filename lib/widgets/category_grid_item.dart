import 'package:flutter/material.dart';

import '../models/category_model.dart';
import '../models/meal_model.dart';

class CategoryGridItem extends StatelessWidget {
  const CategoryGridItem({
    super.key,
    required this.category,
    required this.onSelectCategory,
    required this.availableMeals,
  });

  final CategoryModel category;
  final void Function(CategoryModel category) onSelectCategory;
  final List<MealModel> availableMeals;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onSelectCategory(category),
      borderRadius: BorderRadius.circular(22),
      splashColor: Theme.of(context).colorScheme.primary,
      child: Container(
        padding: const EdgeInsets.all(22),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors: [
              category.color.withOpacity(0.54),
              category.color.withOpacity(0.9),
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: Text(
          category.title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
        ),
      ),
    );
  }
}

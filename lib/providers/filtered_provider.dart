import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal_model.dart';
import 'filters_provider.dart';
import 'meals_provider.dart';

final filteredProvider = Provider((ref) {
  final List<MealModel> meals = ref.watch(mealsProvider);
  final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);

  return meals.where((meal) {
    if (activeFilters[Filter.glutenFree]! && !meal.isGlutenFree) {
      return false;
    }
    if (activeFilters[Filter.lactoseFree]! && !meal.isLactoseFree) {
      return false;
    }
    if (activeFilters[Filter.vegetarian]! && !meal.isVegetarian) {
      return false;
    }
    if (activeFilters[Filter.vegan]! && !meal.isVegan) {
      return false;
    }
    return true;
  }).toList();
});

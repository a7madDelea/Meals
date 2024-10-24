import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal_model.dart';

class FavoritesProviderNotifier extends StateNotifier<List<MealModel>> {
  FavoritesProviderNotifier() : super([]);

  bool toggleMealFavoriteStatus(MealModel meal) {
    final bool isExisting = state.contains(meal);

    if (isExisting) {
      state = state.where((e) => e.id != meal.id).toList();
      return false;
    } else {
      state = [...state, meal];
      return true;
    }
  }
}

final favoritesProvider =
    StateNotifierProvider<FavoritesProviderNotifier, List<MealModel>>(
  (ref) => FavoritesProviderNotifier(),
);

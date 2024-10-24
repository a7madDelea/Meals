import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/data/meals_data.dart';
import 'package:meals/providers/favorites_provider.dart';
import 'package:meals/screens/filters_screen.dart';

import '../models/meal_model.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'meals_screen.dart';

const kInitialFilter = {
  Filter.glutenFree: false,
  Filter.lactoseFree: false,
  Filter.vegan: false,
  Filter.vegetarian: false,
};

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  Map<Filter, bool> _selectedFilter = kInitialFilter;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _onSelectPageFromDrawer(String id) {
    if (id == 'Filters') {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) => FiltersScreen(
            currentFilters: _selectedFilter,
          ),
        ),
      ).then(
        (value) => setState(
          () => _selectedFilter = value ?? kInitialFilter,
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<MealModel> availableMeals = mealsData.where((meal) {
      if (_selectedFilter[Filter.glutenFree]! && !meal.isGlutenFree) {
        return false;
      }
      if (_selectedFilter[Filter.lactoseFree]! && !meal.isLactoseFree) {
        return false;
      }
      if (_selectedFilter[Filter.vegan]! && !meal.isVegan) {
        return false;
      }
      if (_selectedFilter[Filter.vegetarian]! && !meal.isVegetarian) {
        return false;
      }
      return true;
    }).toList();
    Widget activePage = CategoriesScreen(
      availableMeals: availableMeals,
    );
    String activePageTitle = 'Pick your category';

    if (_selectedPageIndex == 1) {
      final List<MealModel> favoritesMeals = ref.watch(favoritesProvider);
      activePage = MealsScreen(
        meals: favoritesMeals,
      );
      activePageTitle = 'Favoraties';
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(
        onSelectPage: _onSelectPageFromDrawer,
      ),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedPageIndex,
        onTap: _selectPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favoraties',
          ),
        ],
      ),
    );
  }
}

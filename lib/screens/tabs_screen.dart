import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal_model.dart';
import '../providers/favorites_provider.dart';
import '../providers/filtered_provider.dart';
import '../widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'filters_screen.dart';
import 'meals_screen.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

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
          builder: (ctx) => const FiltersScreen(),
        ),
      );
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<MealModel> availableMeals = ref.watch(filteredProvider);

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

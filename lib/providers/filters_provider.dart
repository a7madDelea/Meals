import 'package:flutter_riverpod/flutter_riverpod.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class FiltersProviderNotifire extends StateNotifier<Map<Filter, bool>> {
  FiltersProviderNotifire()
      : super(
          {
            Filter.glutenFree: false,
            Filter.lactoseFree: false,
            Filter.vegan: false,
            Filter.vegetarian: false,
          },
        );

  void setFilters(Map<Filter, bool> chosenFilters) {
    state = chosenFilters;
  }

  void setFilter(Filter filter, bool isActive) {
    state = {...state, filter: isActive};
  }
}

final filtersProvider =
    StateNotifierProvider<FiltersProviderNotifire, Map<Filter, bool>>(
  (ref) => FiltersProviderNotifire(),
);

import 'package:flutter/material.dart';

// import '../widgets/main_drawer.dart';
// import 'tabs_screen.dart';

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

enum Filter {
  glutenFree,
  lactoseFree,
  vegan,
  vegetarian,
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFreeFilter = false;
  bool _lactoseFreeFilter = false;
  bool _veganFilter = false;
  bool _vegetarianFilter = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree]!;
    _veganFilter = widget.currentFilters[Filter.vegan]!;
    _vegetarianFilter = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectPage: (id) {
      //     if (id == 'Meals') {
      //       Navigator.pop(context);
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(
      //           builder: (ctx) => const TabsScreen(),
      //         ),
      //       );
      //     } else {
      //       Navigator.pop(context);
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegan: _veganFilter,
            Filter.vegetarian: _vegetarianFilter,
          });
          return false;
        },
        child: Column(
          children: [
            _customSwitch(
              context,
              _glutenFreeFilter,
              (onChanged) {
                setState(() {
                  _glutenFreeFilter = onChanged;
                });
              },
              'Gluten-free',
              'Only include gluten-free meals.',
            ),
            _customSwitch(
              context,
              _lactoseFreeFilter,
              (onChanged) {
                setState(() {
                  _lactoseFreeFilter = onChanged;
                });
              },
              'Lactose-free',
              'Only include lactose-free meals.',
            ),
            _customSwitch(
              context,
              _veganFilter,
              (onChanged) {
                setState(() {
                  _veganFilter = onChanged;
                });
              },
              'Vegan',
              'Only include vegan meals.',
            ),
            _customSwitch(
              context,
              _vegetarianFilter,
              (onChanged) {
                setState(() {
                  _vegetarianFilter = onChanged;
                });
              },
              'Vegetarian',
              'Only include vegetarian meals.',
            ),
          ],
        ),
      ),
    );
  }

  SwitchListTile _customSwitch(
    BuildContext context,
    bool value,
    void Function(bool onChanged) onChanged,
    String title,
    String subtitle,
  ) {
    return SwitchListTile(
      value: value,
      onChanged: onChanged,
      activeColor: Theme.of(context).colorScheme.tertiary,
      contentPadding: const EdgeInsets.only(left: 34, right: 22),
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
      subtitle: Text(
        subtitle,
        style: Theme.of(context).textTheme.labelMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
      ),
    );
  }
}

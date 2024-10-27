import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Map<Filter, bool> activeFilters = ref.watch(filtersProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      body: Column(
        children: [
          _customSwitch(
            context,
            activeFilters[Filter.glutenFree]!,
            (onChanged) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, onChanged);
            },
            'Gluten-free',
            'Only include gluten-free meals.',
          ),
          _customSwitch(
            context,
            activeFilters[Filter.lactoseFree]!,
            (onChanged) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.lactoseFree, onChanged),
            'Lactose-free',
            'Only include lactose-free meals.',
          ),
          _customSwitch(
            context,
            activeFilters[Filter.vegan]!,
            (onChanged) => ref
                .read(filtersProvider.notifier)
                .setFilter(Filter.vegan, onChanged),
            'Vegan',
            'Only include vegan meals.',
          ),
          _customSwitch(
            context,
            activeFilters[Filter.vegetarian]!,
            (onChanged) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, onChanged);
            },
            'Vegetarian',
            'Only include vegetarian meals.',
          ),
        ],
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

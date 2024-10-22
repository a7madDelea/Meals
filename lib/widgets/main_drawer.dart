import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSelectPage});

  final void Function(String id) onSelectPage;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.colorScheme.primaryContainer,
                  theme.colorScheme.primaryContainer.withOpacity(.5),
                ],
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.fastfood,
                  size: 48,
                ),
                const SizedBox(width: 16),
                Text(
                  'Cooking UP!',
                  style: theme.textTheme.titleLarge!.copyWith(
                    color: theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () => onSelectPage('Meals'),
            leading: Icon(
              Icons.restaurant,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Meals',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
          ListTile(
            onTap: () => onSelectPage('Filters'),
            leading: Icon(
              Icons.settings,
              color: theme.colorScheme.onSurface,
            ),
            title: Text(
              'Filters',
              style: theme.textTheme.titleLarge!.copyWith(
                color: theme.colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';
import 'tabs_screen.dart';

class FiltersScreen extends StatelessWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      drawer: MainDrawer(onSelectPage: (id) {
        if (id == 'Meals') {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (ctx) => const TabsScreen(),
            ),
          );
        } else {
          Navigator.pop(context);
        }
      }),
      body: const Center(
        child: Text('Filters Screen'),
      ),
    );
  }
}

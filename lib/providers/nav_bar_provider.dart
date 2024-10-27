import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavBarProviderNotifier extends StateNotifier<int> {
  NavBarProviderNotifier() : super(0);

  void selectPage(int index) {
    state = index;
  }
}

final navBarProvider = StateNotifierProvider<NavBarProviderNotifier, int>(
  (_) => NavBarProviderNotifier(),
);

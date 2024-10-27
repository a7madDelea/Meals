import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../data/meals_data.dart';

final mealsProvider = Provider(
  (ref) => mealsData,
);

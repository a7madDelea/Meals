import 'package:flutter/material.dart';

class MealItemTrait extends StatelessWidget {
  const MealItemTrait({
    super.key,
    required this.lable,
    required this.icon,
  });

  final String lable;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 20,
          color: Colors.black,
        ),
        const SizedBox(width: 6),
        Text(
          lable,
          style: Theme.of(context)
              .textTheme
              .bodyLarge!
              .copyWith(color: Colors.black),
        ),
      ],
    );
  }
}

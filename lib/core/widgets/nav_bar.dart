import 'package:e_commerce_app/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomBottomNav extends StatefulWidget {
  const CustomBottomNav({super.key});

  @override
  State<CustomBottomNav> createState() => _CustomBottomNavState();
}

class _CustomBottomNavState extends State<CustomBottomNav> {
  int selectedIndex = 0;

  final List<Map<String, dynamic>> items = [
    {"icon": Icons.home, "label": "Home"},
    {"icon": Icons.directions_walk, "label": "Work outs"},
    {"icon": Icons.restaurant, "label": "Meal plan"},
    {"icon": Icons.graphic_eq, "label": "Sound"},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: List.generate(items.length, (index) {
          final isSelected = selectedIndex == index;
          return InkWell(
            onTap: () {
              setState(() {
                selectedIndex = index;
              });
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  items[index]["icon"],
                  color: isSelected ? AppColors.yellow : Colors.white,
                ),
                const SizedBox(height: 4),
                Text(
                  items[index]["label"],
                  style: TextStyle(
                    color: isSelected
                        ? AppColors.yellow
                        : Colors.white,
                  ),
                ),
                if (isSelected)
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 2,
                    width: 20,
                    color: AppColors.yellow,
                  ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

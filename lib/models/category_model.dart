import 'package:flutter/material.dart';

class CategoryModel {
  final String name;
  final String iconPath;
  final Color boxColor;

  CategoryModel({
    required this.name,
    required this.iconPath,
    required this.boxColor,
  });

  static List<CategoryModel> getCategories() {
    List<CategoryModel> categories = [];

    categories.add(
      CategoryModel(
        name: 'Ashi waza',
        iconPath: 'assets/icons/ashi-waza.svg',
        boxColor: const Color.fromARGB(255, 255, 140, 140),
      ),
    );
    categories.add(
      CategoryModel(
        name: 'Te waza',
        iconPath: 'assets/icons/te-waza.svg',
        boxColor: const Color.fromARGB(255, 251, 106, 106),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Koshi waza',
        iconPath: 'assets/icons/koshi-waza.svg',
        boxColor: const Color.fromARGB(255, 231, 92, 92),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Sutemi waza',
        iconPath: 'assets/icons/sutemi-waza.svg',
        boxColor: const Color.fromARGB(255, 255, 105, 64),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Katame waza',
        iconPath: 'assets/icons/katame-waza.svg',
        boxColor: const Color.fromARGB(255, 216, 50, 50),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Shime waza',
        iconPath: 'assets/icons/shime-waza.svg',
        boxColor: const Color.fromARGB(255, 156, 242, 152),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'Kansetsu waza',
        iconPath: 'assets/icons/kansetsu-waza.svg',
        boxColor: const Color.fromARGB(255, 154, 238, 150),
      ),
    );

    categories.add(
      CategoryModel(
        name: 'osae komi waza',
        iconPath: 'assets/icons/osae-komi-waza.svg',
        boxColor: const Color.fromARGB(255, 128, 239, 180),
      ),
    );

    return categories;
  }
}

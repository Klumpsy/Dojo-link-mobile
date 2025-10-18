import 'package:dojolink/models/category_model.dart';
import 'package:dojolink/widgets/category_card.dart';
import 'package:flutter/material.dart';

Column categoriesSection() {
  List<CategoryModel> categories = [];

  void getInitalValues() {
    categories = CategoryModel.getCategories();
  }

  getInitalValues();

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 20),
        child: Text(
          'Categorie',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      SizedBox(height: 20),
      SizedBox(
        height: 120,
        child: ListView.separated(
          padding: EdgeInsets.only(left: 20, right: 20),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          separatorBuilder: (context, index) => SizedBox(width: 20),
          itemBuilder: (context, index) {
            return CategoryCard(category: categories[index]);
          },
        ),
      ),
    ],
  );
}

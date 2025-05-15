
import 'package:flutter/material.dart';

class CategoryModel {
  String name;
  String iconPath;
  Color boxColor;

  CategoryModel(
    {
      required this.name,
      required this.iconPath,
      required this.boxColor,

    }
  );

  static List<CategoryModel> getCategories(){
    List<CategoryModel> categories= [
      CategoryModel(name: "Salad", iconPath: "assets/icons/plate.svg", boxColor: Color.fromARGB(255, 146, 253, 150)),
      CategoryModel(name: "Blueberry", iconPath: "assets/icons/blueberry-pancake.svg", boxColor: Color.fromARGB(255, 197, 139, 242)),
      CategoryModel(name: "Smoothie", iconPath: "assets/icons/orange-snacks.svg", boxColor: Color.fromARGB(255, 197, 139, 242)),
      CategoryModel(name: "Honey", iconPath: "assets/icons/honey-pancakes.svg", boxColor: Color.fromARGB(255, 242, 184, 139))
    ];
    return categories;
  }


}
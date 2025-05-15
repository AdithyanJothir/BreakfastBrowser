import 'package:flutter/material.dart';

class DietModel{

  String name;
  String iconPath;
  String level; 
  String duration;
  String calories;
  Color boxColor;
  bool viewIsSelected;


  DietModel({
    required this.name,
    required this.iconPath,
    required this.duration,
    required this.level,
    required this.calories,
    required this.viewIsSelected,
    required this.boxColor
  });

  static List<DietModel> getDiets(){
    List <DietModel> diets = [
      DietModel(name: "Honey Pancake", iconPath: "assets/icons/honey-pancakes.svg", duration: "30 mins", level: "Easy", calories: "180kCal", viewIsSelected: true, boxColor: Color(0xff9DCEFF)
),
      DietModel(name: "Canai Bread", iconPath: "assets/icons/canai-bread.svg", duration: "20 mins", level: "Easy", calories: "230kCal", viewIsSelected: false, boxColor: Color(0xffEEA4CE)
), 
    ];

    return diets;
  }

}
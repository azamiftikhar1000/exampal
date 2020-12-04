import 'package:flutter/material.dart';

class MealsListData {
  MealsListData({
    this.imagePath = '',
    this.titleTxt = '',
    this.startColor = '',
    this.endColor = '',
    this.meals,
    this.kacl = 0,
  });

  String imagePath;
  String titleTxt;
  String startColor;
  String endColor;
  List<String> meals;
  int kacl;

  static List<MealsListData> tabIconsList = <MealsListData>[
    MealsListData(
      imagePath: 'assets/calculator.png',
      titleTxt: 'Maths',
      kacl: 525,
      meals: <String>['Bread,', 'Peanut butter,', 'Apple'],
      // startColor: '#FA7D82',
      // endColor: '#FFB295',
      startColor: '#5cd4dd',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/physics_pulley.png',
      titleTxt: 'Physics',
      kacl: 602,
      meals: <String>['Salmon,', 'Mixed veggies,', 'Avocado'],
      startColor: '#738AE6',
      endColor: '#5C5EDD',
    ),
    MealsListData(
      imagePath: 'assets/dna.png',
      titleTxt: 'Biology',
      kacl: 0,
      meals: <String>['Recommend:', '800 kcal'],
      startColor: '#FE95B6',
      endColor: '#FF5287',
    ),
    MealsListData(
      imagePath: 'assets/flask.png',
      titleTxt: 'Chemistry',
      kacl: 0,
      meals: <String>['Recommend:', '703 kcal'],
      startColor: '#6F72CA',
      endColor: '#1E1466',
    ),
  ];
}

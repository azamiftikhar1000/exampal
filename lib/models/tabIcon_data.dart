import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;

  AnimationController animationController;

  static List<TabIconData> tabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/tab_1.png',
      selectedImagePath: 'assets/tab_1.png',
      index: 0,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/tab_2.png',
      selectedImagePath: 'assets/tab_2s.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/tab_3.png',
      selectedImagePath: 'assets/tab_3s.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/tab_4.png',
      selectedImagePath: 'assets/tab_4s.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];
}

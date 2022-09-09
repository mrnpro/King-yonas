import 'package:flutter/material.dart';
import 'package:kingyonas/constants.dart';

import 'category_buttons.dart';

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
  }) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _currentIndex = 0;
  Color colorProvider(index) {
    if (_currentIndex == index) {
      return kprimary;
    }
    return kSecondaryWhite;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: [
        CategoryButtons(
          color: colorProvider(0),
          onTap: () {
            setState(() {
              _currentIndex = 0;
            });
          },
          title: "Realistic",
          index: 1,
        ),
        CategoryButtons(
          color: colorProvider(1),
          onTap: () {
            setState(() {
              _currentIndex = 1;
            });
          },
          title: "Symbolic",
          index: 2,
        ),
        CategoryButtons(
          color: colorProvider(2),
          onTap: () {
            setState(() {
              _currentIndex = 2;
            });
          },
          title: "Expressive",
          index: 3,
        ),
        CategoryButtons(
          color: colorProvider(3),
          onTap: () {
            setState(() {
              _currentIndex = 3;
            });
          },
          title: "Abstract",
          index: 4,
        )
      ]),
    );
  }
}

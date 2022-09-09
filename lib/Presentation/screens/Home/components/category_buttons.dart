import 'package:flutter/material.dart';
import 'package:kingyonas/constants.dart';

class CategoryButtons extends StatelessWidget {
  const CategoryButtons({
    Key? key,
    required this.title,
    required this.onTap,
    required this.index,
    this.color,
  }) : super(key: key);
  final String title;
  final VoidCallback? onTap;
  final Color? color;
  final int index;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(kRadius),
        ),
        child: Text(
          title,
          style: const TextStyle(color: kwhite),
        ),
      ),
    );
  }
}

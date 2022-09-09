import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kingyonas/Data/Models/Items_model.dart';
import 'package:kingyonas/Presentation/screens/Detail/detail.dart';
import 'package:kingyonas/Presentation/screens/Shop/shop.dart';
import 'package:kingyonas/constants.dart';

import 'components/auto_slider.dart';
import 'components/categories.dart';
import 'components/category_buttons.dart';
import 'components/list_items.dart';
import 'components/search.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: SizedBox(
        width: size.width,
        height: size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                  width: size.width / 3,
                  child: Center(child: Image.asset('assets/images/logo.png'))),
              const SizedBox(
                height: 12,
              ),
              Search(size: size),
              const SizedBox(
                height: 12,
              ),
              const Categories(),
              const SizedBox(
                height: 12,
              ),
              ListItems(size: size)
            ],
          ),
        ),
      ),
    );
  }
}

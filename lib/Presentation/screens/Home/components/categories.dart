import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kingyonas/Data/Models/items_model.dart';
import 'package:kingyonas/Logic/productsBloc/products_bloc.dart';
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
  bool isInitial = true;
  @override
  Widget build(BuildContext context) {
    Color colorProvider(index) {
      if (_currentIndex == index) {
        return kprimary;
      }
      //unfortunately i can not add the default event till then lets add it here
      if (_currentIndex == 0) {
        if (isInitial) {
          context.read<ProductsBloc>().add(
              FetchProductsBasedOnCategory(category: realistic, items: items));

          isInitial = false;
        }
      }
      return kSecondaryWhite;
    }

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: BlocBuilder<ProductsBloc, ProductsState>(
        builder: (context, state) {
          return Row(children: [
            CategoryButtons(
              color: colorProvider(0),
              onTap: () {
                setState(() {
                  context.read<ProductsBloc>().add(FetchProductsBasedOnCategory(
                      category: realistic, items: items));
                  _currentIndex = 0;
                });
              },
              title: realistic,
              index: 1,
            ),
            CategoryButtons(
              color: colorProvider(1),
              onTap: () {
                setState(() {
                  context.read<ProductsBloc>().add(FetchProductsBasedOnCategory(
                      category: symbolic, items: items));
                  _currentIndex = 1;
                });
              },
              title: symbolic,
              index: 2,
            ),
            CategoryButtons(
              color: colorProvider(2),
              onTap: () {
                context.read<ProductsBloc>().add(FetchProductsBasedOnCategory(
                    category: expressive, items: items));
                setState(() {
                  _currentIndex = 2;
                });
              },
              title: expressive,
              index: 3,
            ),
            CategoryButtons(
              color: colorProvider(3),
              onTap: () {
                context.read<ProductsBloc>().add(FetchProductsBasedOnCategory(
                    category: abstracts, items: items));
                setState(() {
                  _currentIndex = 3;
                });
              },
              title: abstracts,
              index: 4,
            )
          ]);
        },
      ),
    );
  }
}

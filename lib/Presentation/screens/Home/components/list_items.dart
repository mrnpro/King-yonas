import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingyonas/Data/Models/items_model.dart';
import 'package:kingyonas/Logic/bloc/products_bloc.dart';
import 'package:kingyonas/Presentation/screens/Detail/detail.dart';
import 'package:kingyonas/constants.dart';

import '../../../../Logic/CartCubit/cart_cubit.dart';

class ListItems extends StatelessWidget {
  const ListItems({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsBloc, ProductsState>(
      builder: (context, state) {
        if (state is ProductsLoading) {
          return const CircularProgressIndicator();
        } else if (state is ProductsLoaded) {
          return Expanded(
              child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: state.items!.length,
            itemBuilder: (context, index) {
              if (index == 0 || index.isEven) {
                return SizedBox(
                  height: 150,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Detail(item: state.items![index]),
                          ));
                    },
                    child: Stack(children: [
                      RItemBody(size: size, item: state.items![index]),
                      RItemImage(
                          size: size,
                          image: state.items![index].imageUrl.toString()),
                      RItemCart(item: state.items![index])
                    ]),
                  ),
                );
              }
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Detail(item: state.items![index]),
                      ));
                },
                child: SizedBox(
                    height: 150,
                    child: Stack(children: [
                      LItemBody(size: size, item: state.items![index]),
                      LItemImage(
                          size: size,
                          image: state.items![index].imageUrl.toString()),
                      LItemCart(item: items[index])
                    ])),
              );
            },
          ));
        }
        return Text("there is no such products");
      },
    );
  }
}

class LItemCart extends StatelessWidget {
  const LItemCart({
    required this.item,
    Key? key,
  }) : super(key: key);
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        right: 10,
        bottom: 10,
        child: GestureDetector(
          onTap: () {
            context.read<CartCubit>().addToCart(Cart(items: item, quantity: 1));
            Fluttertoast.showToast(msg: "Added to cart");
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [boxShadow],
                color: kwhite,
                borderRadius: BorderRadius.circular(kRadius)),
            child: SvgPicture.asset('assets/icons/cart.svg'),
          ),
        ));
  }
}

class LItemImage extends StatelessWidget {
  const LItemImage({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      height: 150,
      width: size.width / 3,
      child: Hero(
        tag: image,
        transitionOnUserGestures: true,
        child: Container(
          decoration: BoxDecoration(
              boxShadow: [boxShadow],
              borderRadius: BorderRadius.circular(kRadius),
              color: kprimary,
              image:
                  DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
        ),
      ),
    );
  }
}

class LItemBody extends StatelessWidget {
  const LItemBody({
    Key? key,
    required this.size,
    required this.item,
  }) : super(key: key);

  final Size size;
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(10),
          width: size.width,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadius),
              color: kSecondaryWhite.withOpacity(0.2)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: size.width / 2,
                  child: const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "Enligntenment",
                      style: TextStyle(
                          color: kprimary,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.centerRight,
                child: SizedBox(
                  width: size.width / 2,
                  child: const Text(
                    "Medium acryliadfadfadc with mixed media on canvas",
                    style: TextStyle(
                        color: kSecondaryWhite,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class RItemCart extends StatelessWidget {
  const RItemCart({
    required this.item,
    Key? key,
  }) : super(key: key);
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: 10,
        bottom: 10,
        child: GestureDetector(
          onTap: () {
            context.read<CartCubit>().addToCart(Cart(items: item, quantity: 1));
            Fluttertoast.showToast(msg: "Added to cart");
          },
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                boxShadow: [boxShadow],
                color: kwhite,
                borderRadius: BorderRadius.circular(kRadius)),
            child: SvgPicture.asset('assets/icons/cart.svg'),
          ),
        ));
  }
}

class RItemBody extends StatelessWidget {
  const RItemBody({
    Key? key,
    required this.size,
    required this.item,
  }) : super(key: key);

  final Size size;
  final ItemModel item;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Container(
          margin: const EdgeInsets.only(top: 20),
          padding: const EdgeInsets.all(10),
          width: size.width,
          height: 100,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadius),
              color: kSecondaryWhite.withOpacity(0.2)),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  item.title.toString(),
                  style: const TextStyle(
                      color: kprimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: SizedBox(
                  width: size.width / 2,
                  child: Text(
                    item.size.toString(),
                    style: TextStyle(
                        fontSize: 10,
                        color: kSecondaryWhite,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

class RItemImage extends StatelessWidget {
  const RItemImage({
    Key? key,
    required this.size,
    required this.image,
  }) : super(key: key);

  final Size size;
  final String image;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      height: 150,
      width: size.width / 3,
      child: Hero(
        transitionOnUserGestures: true,
        tag: image,
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kRadius),
              color: kprimary,
              image:
                  DecorationImage(fit: BoxFit.cover, image: AssetImage(image))),
        ),
      ),
    );
  }
}

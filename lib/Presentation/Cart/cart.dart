import 'package:flutter/material.dart';

import 'package:kingyonas/Data/Models/Items_model.dart';

import '../../../constants.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/background.png')),
        ),
        child: SafeArea(
          child: Container(
            color: Colors.black.withOpacity(0.5),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Carts",
                        style: TextStyle(
                            color: KTextColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Expanded(
                      child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: itemCart.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(itemCart[index].toString()),
                        direction: DismissDirection.endToStart,
                        onDismissed: (direction) {
                          setState(() {
                            itemCart.removeAt(index);
                          });
                        },
                        child: GestureDetector(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width,
                              height: 100,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(kRadius),
                                  color: Colors.black.withOpacity(0.5)),
                              child: Row(children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(kRadius),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(itemCart[index]
                                              .items!
                                              .imageUrl
                                              .toString()))),
                                  width: size.width / 4,
                                  height: 100,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: size.width / 2.3,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              itemCart[index]
                                                  .items!
                                                  .title
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: kwhite,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              "${itemCart[index].quantity.toString()} X",
                                              style: const TextStyle(
                                                  color: kwhite, fontSize: 20)),
                                        ),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              itemCart[index]
                                                  .items!
                                                  .price
                                                  .toString(),
                                              style: const TextStyle(
                                                  color: kwhite, fontSize: 20)),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        ),
                      );
                    },
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

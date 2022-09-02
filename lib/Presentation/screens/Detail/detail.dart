import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:kingyonas/Data/Models/Items_model.dart';

import '../../../constants.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key, required this.item}) : super(key: key);
  final ItemModel? item;

  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var cartitemsvalue = 1;
  _increament() {
    setState(() {
      cartitemsvalue++;
    });
  }

  _decreament() {
    setState(() {
      cartitemsvalue--;
    });
  }

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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      width: size.width,
                      height: size.height / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  widget.item!.imageUrl.toString()))),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 12,
                            width: 12,
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(Icons.arrow_back_ios),
                              color: kwhite,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.item!.title.toString(),
                        style: const TextStyle(
                            color: KTextColor,
                            fontSize: 30,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.item!.size.toString(),
                        style: const TextStyle(
                            color: KTextColor,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        widget.item!.description.toString(),
                        style: const TextStyle(
                          color: KTextColor,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                            onPressed: () {
                              _decreament();
                            },
                            child: Text("-",
                                style: TextStyle(color: kwhite, fontSize: 50))),
                        Text("$cartitemsvalue X",
                            style: TextStyle(color: kwhite, fontSize: 30)),
                        TextButton(
                            onPressed: () {
                              setState(() {
                                _increament();
                              });
                            },
                            child: const Text("+",
                                style: TextStyle(color: kwhite, fontSize: 50))),
                      ],
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(kRadius)),
                        backgroundColor: kwhite,
                      ),
                      onPressed: () {
                        itemCart.add(
                            Cart(items: widget.item, quantity: cartitemsvalue));
                        Fluttertoast.showToast(msg: "Added to cart");
                      },
                      child: const Center(
                          child: Text(
                        "ADD TO CART",
                        style: TextStyle(color: kprimary),
                      )),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

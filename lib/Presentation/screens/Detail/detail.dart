import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingyonas/Logic/CartCubit/cart_cubit.dart';
import 'package:kingyonas/Presentation/screens/Cart/components/bottom_choose_payment.dart';

import '../../../Data/Models/items_model.dart';
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
        body: BlocBuilder<CartCubit, CartState>(
      builder: (context, CartState) =>
          // TODO: implement listener

          SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height / 1.4,
              child: Stack(
                children: [
                  Hero(
                    transitionOnUserGestures: true,
                    tag: widget.item!.imageUrl.toString(),
                    child: Container(
                      width: size.width,
                      height: size.height / 1.6,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  widget.item!.imageUrl.toString()))),
                      child: Stack(
                        children: const [
                          BackIconButton(),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 10,
                    left: 10,
                    right: 10,
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.all(8),
                      height: 70,
                      margin: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(kRadius),
                          boxShadow: [boxShadow],
                          color: kwhite),
                      child: Column(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.item!.title.toString(),
                              style: const TextStyle(
                                  color: kprimary,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              widget.item!.size.toString(),
                              style: const TextStyle(
                                  color: kSecondaryWhite,
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      widget.item!.description.toString(),
                      style: const TextStyle(
                        color: kSecondaryWhite,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: size.width * 0.5,
                        child: TextButton(
                          style: TextButton.styleFrom(
                            padding: const EdgeInsets.all(20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(kRadius)),
                            backgroundColor: kprimary,
                          ),
                          onPressed: () {
                            BottomChoosePayment.show(context, size);
                          },
                          child: const Center(
                              child: Text(
                            "Buy Now",
                            style: TextStyle(color: kwhite),
                          )),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kRadius),
                            color: kwhite,
                            boxShadow: [boxShadow]),
                        width: 50,
                        height: 50,
                        child: IconButton(
                            onPressed: () {
                              context.read<CartCubit>().addToCart(Cart(
                                  items: widget.item,
                                  quantity: cartitemsvalue));
                              Fluttertoast.showToast(msg: "Added to cart");
                              Navigator.pop(context);
                            },
                            icon: SvgPicture.asset('assets/icons/cart.svg')),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

class BackIconButton extends StatelessWidget {
  const BackIconButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 12,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: SafeArea(
          child: Container(
            margin: const EdgeInsets.all(5),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kRadius), color: kwhite),
            child: const Center(
              child: Icon(Icons.arrow_back_ios),
            ),
          ),
        ),
      ),
    );
  }
}

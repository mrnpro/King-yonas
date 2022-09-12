import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kingyonas/Presentation/screens/Detail/detail.dart';
import 'package:lottie/lottie.dart';

import '../../../../Logic/CartCubit/cart_cubit.dart';
import '../../../../constants.dart';

class CartLists extends StatefulWidget {
  const CartLists({Key? key}) : super(key: key);

  @override
  State<CartLists> createState() => _CartListsState();
}

class _CartListsState extends State<CartLists> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<CartCubit, CartState>(
      builder: (context, state) {
        if (state.itemCart.isEmpty) {
          return SizedBox(
            height: size.height / 1.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () => {},
                    child: LottieBuilder.asset('assets/lottie/emptyCart.json')),
                const Text("Empty Cart")
              ],
            ),
          );
        }
        return Expanded(
            child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: state.itemCart.length,
          itemBuilder: (context, index) {
            return Dismissible(
              key: Key(state.itemCart[index].items!.id.toString()),
              direction: DismissDirection.endToStart,
              onDismissed: (direction) {
                setState(() {
                  context.read<CartCubit>().removeFromCart(index);
                });
              },
              child: GestureDetector(
                onTap: () {
                  print("pressing");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              Detail(item: state.itemCart[index].items)));
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: size.width,
                    height: 100,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kRadius),
                        color: kSecondaryWhite.withOpacity(0.2)),
                    child: Row(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kRadius),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: AssetImage(state
                                    .itemCart[index].items!.imageUrl
                                    .toString()))),
                        width: size.width / 4,
                        height: 100,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: size.width / 2,
                          child: Column(
                            children: [
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                    state.itemCart[index].items!.title
                                        .toString(),
                                    style: const TextStyle(
                                        color: kSecondaryWhite,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                        "${state.itemCart[index].items!.price.toString()}ETB ${state.itemCart[index].quantity.toString()} X",
                                        style: const TextStyle(
                                            color: kprimary, fontSize: 20)),
                                  ),
                                  Row(
                                    children: [
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            primary: kwhite,
                                            backgroundColor: Colors.red,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          onPressed: () {
                                            context
                                                .read<CartCubit>()
                                                .decreament(index);
                                          },
                                          child: const Text("-"),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 13,
                                      ),
                                      SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: TextButton(
                                          style: TextButton.styleFrom(
                                            primary: kwhite,
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                          ),
                                          onPressed: () {
                                            context
                                                .read<CartCubit>()
                                                .increament(index);
                                          },
                                          child: const Text("+"),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                              const SizedBox(
                                height: 6,
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
        ));
      },
    );
  }
}

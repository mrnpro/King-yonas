import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingyonas/Logic/cubit/cart_cubit.dart';
import 'package:kingyonas/Presentation/alerts/payment_alert.dart';
import 'package:kingyonas/Presentation/screens/Cart/components/cart_lists.dart';

import '../../../constants.dart';
import 'components/cirular_buttons.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

double calculateTotalPrice(List items) {
  double total = 0;
  for (int i = 0; i < items.length; i++) {
    total = total + items[i].items!.price;
  }
  return total;
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) => state.itemCart.isNotEmpty
              ? FloatingActionButton(
                  backgroundColor: const Color.fromARGB(255, 0, 82, 3),
                  child: const Icon(Icons.done),
                  onPressed: () {
                    PaymentAlert.show(context);
                  })
              : const Text("")),
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
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Carts",
                          style: TextStyle(
                              color: KTextColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                        BlocBuilder<CartCubit, CartState>(
                          builder: (context, state) {
                            if (state.itemCart.isNotEmpty) {
                              return Text(
                                "total: ${calculateTotalPrice(state.itemCart).toString()} ETB",
                                style: TextStyle(
                                  color: KTextColor,
                                  fontSize: 15,
                                ),
                              );
                            }
                            return const Text("");
                          },
                        ),
                      ],
                    ),
                  ),
                  const CartLists()
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

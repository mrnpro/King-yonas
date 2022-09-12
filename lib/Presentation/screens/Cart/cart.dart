import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingyonas/Logic/CartCubit/cart_cubit.dart';
import 'package:kingyonas/Presentation/alerts/payment_alert.dart';
import 'package:kingyonas/Presentation/screens/Cart/components/cart_lists.dart';

import '../../../constants.dart';
import 'components/bottom_info_sheet.dart';
import 'components/cirular_buttons.dart';

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
      floatingActionButton: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) => state.itemCart.isNotEmpty
              ? FloatingActionButton(
                  backgroundColor: kprimary,
                  child: const Icon(Icons.done),
                  onPressed: () {
                    // PaymentAlert.show(context);
                    BottomUserInformationSheet.show(context, size);
                  })
              : const Text("")),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "Carts",
                      style: TextStyle(
                          color: kSecondaryWhite,
                          fontSize: 30,
                          fontWeight: FontWeight.bold),
                    ),
                    BlocBuilder<CartCubit, CartState>(
                      builder: (context, state) {
                        if (state.itemCart.isNotEmpty) {
                          return Text(
                            "total: ${state.total} ETB",
                            style: const TextStyle(
                              color: kSecondaryWhite,
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
    );
  }
}

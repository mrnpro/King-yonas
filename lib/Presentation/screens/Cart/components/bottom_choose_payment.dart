import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingyonas/constants.dart';

class BottomChoosePayment {
  static Future<dynamic> show(BuildContext context, Size size) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return PaymentBody(size: size);
        });
  }
}

class PaymentBody extends StatelessWidget {
  const PaymentBody({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const DefaultTextStyle(
                    style: TextStyle(
                        color: kSecondaryWhite,
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                    child: Text(
                      "Choose payment method",
                    )),
                const SizedBox(
                  height: 10,
                ),
                const SizedBox(
                  height: 10,
                ),
                Wrap(
                  children: const [
                    CircularPaymentButtons(image: 'assets/images/telebirr.jpg'),
                    CircularPaymentButtons(image: 'assets/images/amole.jpg'),
                    CircularPaymentButtons(image: 'assets/images/cbe.png'),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CircularPaymentButtons extends StatelessWidget {
  const CircularPaymentButtons({
    Key? key,
    required this.image,
  }) : super(key: key);
  final String image;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          height: 70,
          width: 70,
          child: GestureDetector(
              onTap: () {
                Fluttertoast.showToast(
                    msg: "future will be added soon",
                    toastLength: Toast.LENGTH_SHORT);
              },
              child: Container(
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(image)),
                    color: kwhite,
                    borderRadius: BorderRadius.circular(100)),
              ))),
    );
  }
}

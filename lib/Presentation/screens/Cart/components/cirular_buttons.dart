import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../constants.dart';

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

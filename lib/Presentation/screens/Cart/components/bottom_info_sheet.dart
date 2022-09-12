import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingyonas/Presentation/screens/Cart/components/bottom_choose_payment.dart';
import 'package:kingyonas/constants.dart';

class BottomUserInformationSheet {
  static Future<dynamic> show(BuildContext context, Size size) {
    return showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kRadius),
        ),
        backgroundColor: Colors.white,
        context: context,
        builder: (context) {
          return InfoBody(
            size: size,
          );
        });
  }
}

class InfoBody extends StatelessWidget {
  const InfoBody({
    Key? key,
    required this.size,
  }) : super(key: key);
  final Size size;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SizedBox(
        height: size.height / 2,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kwhite,
                      boxShadow: [boxShadow]),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Your Username',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kwhite,
                      boxShadow: [boxShadow]),
                  child: const TextField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Your PhoneNumber',
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kRadius),
                      color: kwhite,
                      boxShadow: [boxShadow]),
                  child: const TextField(
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Your Location',
                    ),
                  ),
                ),
                TextButton(
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(kRadius)),
                    backgroundColor: kprimary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                    BottomChoosePayment.show(context, size);
                  },
                  child: const Center(
                      child: Text(
                    "Next",
                    style: TextStyle(color: kwhite),
                  )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

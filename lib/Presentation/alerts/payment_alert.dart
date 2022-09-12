// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '../../constants.dart';
// import '../screens/Cart/components/cirular_buttons.dart';

// class PaymentAlert {
//   static Future<Object?> show(BuildContext context) {
//     return showGeneralDialog(
//         context: context,
//         barrierDismissible: true,
//         barrierLabel:
//             MaterialLocalizations.of(context).modalBarrierDismissLabel,
//         transitionDuration: const Duration(milliseconds: 200),
//         pageBuilder: (BuildContext context, Animation animation,
//                 Animation secondaryAnimation) =>
//             Center(
//               child: Container(
//                 width: MediaQuery.of(context).size.width / 1.2,
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(kRadius),
//                     color: kprimary),
//                 child: Container(
//                   color: Colors.black.withOpacity(0.5),
//                   child: Padding(
//                     padding: const EdgeInsets.all(20),
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: [
//                           const DefaultTextStyle(
//                               style: TextStyle(
//                                   color: kwhite,
//                                   fontSize: 21,
//                                   fontWeight: FontWeight.bold),
//                               child: Text(
//                                 "Choose payment method",
//                               )),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           const SizedBox(
//                             height: 10,
//                           ),
//                           Wrap(
//                             children: const [
//                               CircularPaymentButtons(
//                                   image: 'assets/images/telebirr.jpg'),
//                               CircularPaymentButtons(
//                                   image: 'assets/images/amole.jpg'),
//                               CircularPaymentButtons(
//                                   image: 'assets/images/cbe.png'),
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//             ));
//   }
// }

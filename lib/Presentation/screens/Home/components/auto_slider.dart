// import 'package:carousel_slider/carousel_slider.dart';
// import 'package:flutter/animation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import '../../../../Data/Models/Items_model.dart';
// import '../../../../constants.dart';
// import '../../Shop/shop.dart';

// class AutoSlider extends StatelessWidget {
//   const AutoSlider({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return CarouselSlider(
//       options: CarouselOptions(
//         height: 300,
//         aspectRatio: 16 / 9,
//         viewportFraction: 0.8,
//         initialPage: 0,
//         enableInfiniteScroll: true,
//         reverse: false,
//         autoPlay: true,
//         autoPlayInterval: Duration(seconds: 3),
//         autoPlayAnimationDuration: Duration(milliseconds: 800),
//         autoPlayCurve: Curves.fastOutSlowIn,
//         enlargeCenterPage: true,
//         scrollDirection: Axis.horizontal,
//       ),
//       items: [
//         items[0],
//         items[1],
//         items[2],
//       ].map((i) {
//         return Builder(
//           builder: (BuildContext context) {
//             return Container(
//                 width: MediaQuery.of(context).size.width,
//                 margin: const EdgeInsets.symmetric(horizontal: 5.0),
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(5),
//                     image: DecorationImage(
//                         fit: BoxFit.cover,
//                         image: AssetImage(i.imageUrl.toString()))),
//                 child: Container(
//                   color: Colors.black.withOpacity(0.5),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(i.title.toString(),
//                           style: const TextStyle(color: kwhite, fontSize: 20)),
//                       const SizedBox(
//                         height: 12,
//                       ),
//                       GestureDetector(
//                         onTap: () {
//                           Navigator.push(context,
//                               MaterialPageRoute(builder: (context) => Shop()));
//                         },
//                         child: Container(
//                           width: 100,
//                           height: 50,
//                           decoration:
//                               BoxDecoration(border: Border.all(color: kwhite)),
//                           child: const Center(
//                               child: Text(
//                             "SEE MORE",
//                             style: TextStyle(color: kwhite),
//                           )),
//                         ),
//                       )
//                     ],
//                   ),
//                 ));
//           },
//         );
//       }).toList(),
//     );
//   }
// }

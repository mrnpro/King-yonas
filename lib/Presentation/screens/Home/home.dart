import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:kingyonas/Data/Models/Items_model.dart';
import 'package:kingyonas/Presentation/screens/Detail/detail.dart';
import 'package:kingyonas/Presentation/screens/Shop/shop.dart';
import 'package:kingyonas/constants.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        height: size.height,
        width: size.width,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/background.png'))),
        child: Container(
          color: Colors.black.withOpacity(0.5),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: size.width / 4,
                      child:
                          Center(child: Image.asset('assets/images/logo.png'))),
                  SizedBox(
                    height: 12,
                  )
                  // const Padding(
                  //   padding: EdgeInsets.all(8.0),
                  //   child: Align(
                  //     alignment: Alignment.centerLeft,
                  //     child: Text(
                  //       "",
                  //       style: TextStyle(
                  //           color: KTextColor,
                  //           fontSize: 30,
                  //           fontWeight: FontWeight.bold),
                  //     ),
                  //   ),
                  // ),,
                  ,
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 300,
                      aspectRatio: 16 / 9,
                      viewportFraction: 0.8,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3),
                      autoPlayAnimationDuration: Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    items: [
                      items[0],
                      items[1],
                      items[2],
                    ].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image:
                                          AssetImage(i.imageUrl.toString()))),
                              child: Container(
                                color: Colors.black.withOpacity(0.5),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(i.title.toString(),
                                        style: const TextStyle(
                                            color: kwhite, fontSize: 20)),
                                    const SizedBox(
                                      height: 12,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => Shop()));
                                      },
                                      child: Container(
                                        width: 100,
                                        height: 50,
                                        decoration: BoxDecoration(
                                            border: Border.all(color: kwhite)),
                                        child: const Center(
                                            child: Text(
                                          "SEE MORE",
                                          style: TextStyle(color: kwhite),
                                        )),
                                      ),
                                    )
                                  ],
                                ),
                              ));
                        },
                      );
                    }).toList(),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  const Text(
                      "Yonas Degefa’s vast and varied catalog of work demonstrates an incessant exploration of three main themes.",
                      style: const TextStyle(color: kwhite, fontSize: 15)),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Shop()));
                    },
                    child: Container(
                      width: 150,
                      height: 50,
                      decoration:
                          BoxDecoration(border: Border.all(color: kwhite)),
                      child: const Center(
                          child: Text(
                        "ABOUT THE ARTIST",
                        style: TextStyle(color: kwhite),
                      )),
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}

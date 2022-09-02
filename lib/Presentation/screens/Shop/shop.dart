import 'package:flutter/material.dart';
import 'package:kingyonas/Data/Models/Items_model.dart';
import 'package:kingyonas/Presentation/screens/Detail/detail.dart';
import 'package:kingyonas/constants.dart';

class Shop extends StatelessWidget {
  const Shop({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/background.png'))),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [
                    SizedBox(
                        width: size.width / 4,
                        child: Center(
                            child: Image.asset('assets/images/logo.png'))),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Shop",
                          style: TextStyle(
                              color: KTextColor,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                        child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Detail(
                                          item: items[index],
                                        )));
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              width: size.width,
                              height: 200,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(kRadius),
                                  color: Colors.black.withOpacity(0.5)),
                              child: Row(children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(kRadius),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: AssetImage(items[index]
                                              .imageUrl
                                              .toString()))),
                                  width: size.width / 3,
                                  height: 200,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    width: size.width / 2.3,
                                    child: Column(
                                      children: [
                                        Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                              items[index].title.toString(),
                                              style: const TextStyle(
                                                  color: kwhite,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20)),
                                        ),
                                        Text(
                                            items[index].description.toString(),
                                            style: const TextStyle(
                                                color: kwhite, fontSize: 10)),
                                        const SizedBox(
                                          height: 6,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            //itemCart.add(items[index]);
                                          },
                                          child: Container(
                                            width: 100,
                                            height: 50,
                                            decoration: BoxDecoration(
                                                border:
                                                    Border.all(color: kwhite)),
                                            child: const Center(
                                                child: Text(
                                              "SEE MORE",
                                              style: TextStyle(color: kwhite),
                                            )),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ]),
                            ),
                          ),
                        );
                      },
                    ))
                  ],
                ),
              ),
            )));
  }
}

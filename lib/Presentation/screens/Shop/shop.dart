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
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Gallary",
                  style: TextStyle(
                      color: kSecondaryWhite,
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
                          color: kSecondaryWhite.withOpacity(0.2)),
                      child: Row(children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(kRadius),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      items[index].imageUrl.toString()))),
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
                                  child: Text(items[index].title.toString(),
                                      style: const TextStyle(
                                          color: kSecondaryWhite,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20)),
                                ),
                                Flexible(
                                  child: Text(
                                      items[index].description.toString(),
                                      textAlign: TextAlign.left,
                                      maxLines: 5,
                                      softWrap: false,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                          color: kSecondaryWhite,
                                          fontSize: 10)),
                                ),
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
                                            Border.all(color: kSecondaryWhite)),
                                    child: const Center(
                                        child: Text(
                                      "SEE MORE",
                                      style: TextStyle(color: kSecondaryWhite),
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
    ));
  }
}

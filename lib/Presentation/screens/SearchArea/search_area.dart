import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:kingyonas/constants.dart';

class SearchArea extends StatelessWidget {
  const SearchArea({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SafeArea(
                  child: Row(
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back_ios)),
                      const Expanded(
                        child: TextField(
                          autofocus: true,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search arts',
                          ),
                        ),
                      ),
                      IconButton(
                          onPressed: () {
                            Fluttertoast.showToast(msg: "nothing to search");
                            // Navigator.pop(context);
                          },
                          icon: const Icon(Icons.search)),
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

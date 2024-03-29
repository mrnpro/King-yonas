import 'package:flutter/material.dart';
import 'package:kingyonas/Presentation/screens/SearchArea/search_area.dart';

import '../../../../constants.dart';

class Search extends StatelessWidget {
  const Search({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => SearchArea()));
      },
      child: Container(
        padding: const EdgeInsets.all(15),
        width: size.width,
        decoration: BoxDecoration(
            boxShadow: [boxShadow],
            borderRadius: BorderRadius.circular(kRadius),
            color: kwhite),
        child: Row(
          children: const [
            Icon(Icons.search),
            SizedBox(
              width: 10,
            ),
            Text("Search arts")
          ],
        ),
      ),
    );
  }
}

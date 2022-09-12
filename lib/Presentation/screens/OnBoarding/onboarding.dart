import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:kingyonas/Logic/bloc/products_bloc.dart';
import 'package:kingyonas/Presentation/common/BottomNavigatom/custom_bottom_navigation.dart';

class OnBording extends StatelessWidget {
  OnBording({Key? key}) : super(key: key);
  final pages = [
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'assets/images/img1.png',
        title: 'what is art',
        body:
            'Art is a highly diverse range of human activities which create visual, auditory, or performed artifacts',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/images/img2.png',
        title: 'As an artist,',
        body:
            'I love to create beautiful things. I paint, I draw, I work with clay, I carve stone. I care a lot about the way things look and feel ',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/images/img3.png',
        title: 'how to get them ?',
        body: 'Buy me arts from anywere',
        doAnimateImage: true),
  ];
  @override
  Widget build(BuildContext context) {
    final _productsbloc = BlocProvider.of<ProductsBloc>(context);
    return Scaffold(
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => ProductsBloc(),
                        child: const CustomBottomNavigation(),
                      )));
        },
        finishCallback: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => BlocProvider(
                        create: (context) => ProductsBloc(),
                        child: const CustomBottomNavigation(),
                      )));
        },
      ),
    );
  }
}

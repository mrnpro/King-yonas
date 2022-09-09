import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kingyonas/Logic/bloc/products_bloc.dart';
import 'package:kingyonas/Presentation/common/BottomNavigatom/custom_bottom_navigation.dart';
import 'package:kingyonas/constants.dart';
import 'package:async/async.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future splashLoader(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));
    print("smthing calling me ");
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider(
                  create: (_) => ProductsBloc(),
                  child: const CustomBottomNavigation(),
                )));
  }

  @override
  void initState() {
    splashLoader(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              SizedBox(
                height: size.height,
                width: size.width,
                child: ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Image.asset(
                    'assets/images/img5.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                  child: Container(
                color: Colors.black.withOpacity(0.8),
              )),
              Positioned(
                  //  left: size.width / 3.9,
                  top: size.height / 2.3,
                  child: SizedBox(
                      width: size.width,
                      child: Center(
                          child: Image.asset('assets/images/logo.png')))),
            ],
          )),
    );
  }
}

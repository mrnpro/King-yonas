import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kingyonas/Logic/bloc/products_bloc.dart';
import 'package:kingyonas/Presentation/common/BottomNavigatom/custom_bottom_navigation.dart';
import 'package:kingyonas/constants.dart';
import 'package:async/async.dart';

import '../OnBoarding/onboarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Future splashLoader(BuildContext context) async {
    await Future.delayed(Duration(seconds: 4));

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (context) => BlocProvider(
                create: (_) => ProductsBloc(),
                child: CustomBottomNavigation(),
              )),
      (route) => false,
    );
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
      body: SizedBox(
          height: size.height,
          width: size.width,
          child: SizedBox(
              width: size.width,
              child: Center(child: Image.asset('assets/images/logo.png')))),
    );
  }
}

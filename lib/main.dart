import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kingyonas/Presentation/screens/OnBoarding/onboarding.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:kingyonas/Presentation/screens/SplashScreen/splash_screen.dart';

import 'Logic/CartCubit/cart_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool timeOutLoader = false;

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CartCubit>(
      create: (context) => CartCubit(),
      child: MaterialApp(
        supportedLocales: const [
          Locale('en'),
          Locale('ar'),
          Locale('es'),
          Locale('de'),
          Locale('fr'),
          Locale('el'),
          Locale('et'),
          Locale('nb'),
          Locale('nn'),
          Locale('pl'),
          Locale('pt'),
          Locale('ru'),
          Locale('hi'),
          Locale('ne'),
          Locale('uk'),
          Locale('hr'),
          Locale('tr'),
          Locale('lv'),
          Locale('lt'),
          Locale('ku'),
          Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hans'), // Generic Simplified Chinese 'zh_Hans'
          Locale.fromSubtags(
              languageCode: 'zh',
              scriptCode: 'Hant'), // Generic traditional Chinese 'zh_Hant'
        ],
        localizationsDelegates: const [
          CountryLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        title: 'King Yonas',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}

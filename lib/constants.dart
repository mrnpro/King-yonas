import 'package:flutter/material.dart';

const kprimary = Colors.orange;
const kwhite = Color.fromARGB(255, 255, 255, 255);
const kSecondaryWhite = Color.fromARGB(255, 104, 104, 104);

final kgreen = const Color.fromARGB(255, 69, 255, 115).withOpacity(0.1);
const kRadius = 16.0;
final boxShadow = BoxShadow(
  color: kprimary.withOpacity(0.1),
  spreadRadius: 3,
  blurRadius: 2,
  offset: const Offset(0, 2), // changes position of shadow
);
//categories
const realistic = "Realistic";
const symbolic = "Symbolic";
const expressive = "Expressive";
const abstracts = "Abstract";

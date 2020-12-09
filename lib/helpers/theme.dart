import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

TextTheme phodTextTheme(BuildContext context) {
  return GoogleFonts.montserratTextTheme(Theme
      .of(context)
      .textTheme).copyWith(
    headline4: GoogleFonts.playfairDisplay(
        textStyle: Theme.of(context).textTheme.headline4
    ),
    headline5: GoogleFonts.playfairDisplay(
        textStyle: Theme.of(context).textTheme.headline5
    ),
    headline6: GoogleFonts.playfairDisplay(
        textStyle: Theme.of(context).textTheme.headline6,
        fontSize: 22,
        fontWeight: FontWeight.bold
    ),
  );
}
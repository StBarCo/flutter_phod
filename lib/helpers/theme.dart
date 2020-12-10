import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

TextTheme phodTextTheme(BuildContext context) {
  return GoogleFonts.montserratTextTheme(Theme
      .of(context)
      .textTheme).copyWith(
    headline4: GoogleFonts.playfairDisplay(
        textStyle: Theme.of(context).textTheme.headline4.copyWith(
            fontFeatures: [FontFeature.enable('smcp'), FontFeature.oldstyleFigures(),],
          fontSize: 28,
          // color: Theme.of(context).primaryColorDark],
        )
    ),
    headline5: GoogleFonts.playfairDisplay(
        textStyle: Theme.of(context).textTheme.headline5.copyWith(
          fontFeatures: [FontFeature.oldstyleFigures(),],
          fontStyle: FontStyle.italic,
          fontSize: 20,
        ),

    ),
    headline6: GoogleFonts.playfairDisplay(
        textStyle: Theme.of(context).textTheme.headline6,
        fontSize: 22,
        fontWeight: FontWeight.bold
    ),
    button: GoogleFonts.playfairDisplay(),
    caption: TextStyle(fontSize: 14),
    bodyText1: TextStyle(fontSize: 18),
    bodyText2: GoogleFonts.montserrat(
      textStyle: TextStyle(fontSize: 16),
    ),
    overline: TextStyle(fontSize: 12),
  );
}

/*
STANDARD GOOGLE MATERIAL DESIGN SPECS
NAME         SIZE  WEIGHT  SPACING
headline1    96.0  light   -1.5
headline2    60.0  light   -0.5
headline3    48.0  regular  0.0
headline4    34.0  regular  0.25
headline5    24.0  regular  0.0
headline6    20.0  medium   0.15
subtitle1    16.0  regular  0.15
subtitle2    14.0  medium   0.1
body1        16.0  regular  0.5   (bodyText1)
body2        14.0  regular  0.25  (bodyText2)
button       14.0  medium   1.25
caption      12.0  regular  0.4
overline     10.0  regular  1.5
 */
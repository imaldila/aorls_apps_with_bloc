import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double kPadding = 16.0;

final kElevatedButtonStyle = ElevatedButton.styleFrom(
  elevation: kPadding / 2,
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(kPadding),
  ),
);

final kGoogleFontTextTheme = GoogleFonts.montserratTextTheme().copyWith(
  bodyText2: const TextStyle(
    fontSize: 16,
  ),
);

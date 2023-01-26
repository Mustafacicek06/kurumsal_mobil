import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kurumsal_mobil/core/init/theme/app_color_service.dart';

class ThemeService {
  static ThemeService instance = ThemeService._();

  ThemeService._();

  ThemeData lightTheme = ThemeData(
    primaryColor: AppColorService.primary,
    backgroundColor: AppColorService.white,
    brightness: Brightness.light,
    appBarTheme: AppBarTheme(
      centerTitle: true,
      systemOverlayStyle: SystemUiOverlayStyle.dark,
      backgroundColor: Colors.transparent,
      elevation: 0,
    ),
    textTheme: GoogleFonts.poppinsTextTheme().copyWith(),
  );
}

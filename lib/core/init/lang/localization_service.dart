import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LocalizationService {
  static LocalizationService instance = LocalizationService._();

  static const String path = "assets/translations";

  LocalizationService._();

  static const Locale fallbackLocale = Locale('en', "US");

  Locale get currentLanguage => Get.locale ?? fallbackLocale;

  static List<Locale> languages = const <Locale>[
    Locale("en", "US"),
    Locale("tr", "TR"),
  ];
}

extension LocaleExtension on Locale {
  bool isTurkish() => languageCode == "tr";

  bool isEnglish() => languageCode == "en";
}

import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:kurumsal_mobil/core/init/lang/localization_service.dart';
import 'package:kurumsal_mobil/core/init/manager/local_manager.dart';
import 'package:kurumsal_mobil/core/init/theme/theme_service.dart';

import 'package:kurumsal_mobil/product/navigation/app_pages.dart';
import 'firebase_options.dart';

void main() async {
  await LocalManager.instance.initializeHive();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  //landscape orientation
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: LocalizationService.languages,
      path: LocalizationService.path,
      fallbackLocale: LocalizationService.fallbackLocale,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Kurumsal Mobil',
        locale: context.locale,
        supportedLocales: context.supportedLocales,
        localizationsDelegates: context.localizationDelegates,
        theme: ThemeService.instance.lightTheme,
        getPages: AppPages.pages,
        initialRoute: AppPages.initial,
      ),
    );
  }
}

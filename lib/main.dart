import 'dart:io';
import 'package:archive_app/views/screens/home_screen.dart';
import 'package:archive_app/views/screens/login_screen.dart';
import 'package:archive_app/views/screens/onboarding_screen.dart';
import 'package:archive_app/views/screens/server_control_screen.dart';
import 'package:archive_app/views/screens/settings_screen.dart';
import 'package:archive_app/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_storage/get_storage.dart';

class PostHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() async {
  await GetStorage.init(); // GetStorage'ı başlatma
  HttpOverrides.global = PostHttpOverrides();
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sunucu ayarları yapılmış mı diye kontrol ediyoruz.

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Archive App',
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => SplashScreen(),
          '/login': (context) => LoginPage(),
          '/server': (context) => ServerControlPage(),
          '/settings': (context) => SettingPage(),
          '/home': (context) => HomePage(),
          '/intro': (context) => IntroductionScreen(),
        });
  }
}

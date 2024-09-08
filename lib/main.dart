import 'package:archive_app/views/screens/server_control_screen.dart';
import 'package:archive_app/views/screens/settings_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await GetStorage.init(); // GetStorage'ı başlatma
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Sunucu ayarları yapılmış mı diye kontrol ediyoruz.

    return MaterialApp(
      debugShowCheckedModeBanner: false,
   initialRoute: '/',
      routes: {
        '/': (context) => ServerControlPage(),
        '/settings': (context) => SettingPage(),
      },
    );
  }
}

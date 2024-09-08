import 'package:archive_app/utils/app_colors.dart';
import 'package:archive_app/views/screens/login_screen.dart';

import 'package:archive_app/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class ServerControlPage extends StatefulWidget {
  ServerControlPage({super.key});

  @override
  State<ServerControlPage> createState() => _ServerControlPageState();
}

class _ServerControlPageState extends State<ServerControlPage> {
  final box = GetStorage();
  @override
  void initState() {
    super.initState();
    // Eğer sunucu ayarları yapılmışsa, login ekranına yönlendir
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (box.read('serverIP') == null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SettingPage()),
        );
      } else {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginPage()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Eğer sunucu ayarları yapılmışsa, login ekranına yönlendir

    return Scaffold(
      backgroundColor: AppColors.borderColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Lütfen sunucu ayarlarını yapın.',
              style: TextStyle(color: AppColors.backgroundColor, fontSize: 30),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SettingPage()),
                  );
                },
                child: Container(
                  child: SizedBox(
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Text(
                        'Ayarlar',
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.errorColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

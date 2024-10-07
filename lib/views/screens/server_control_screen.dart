import 'package:archive_app/viewmodel/server_ip.dart';
import 'package:archive_app/utils/app_colors.dart';

import 'package:archive_app/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ServerControlPage extends ConsumerWidget {
  const ServerControlPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverIP = ref.watch(serverIpProvider);
    final warningText = "Sunucu ayarlarını yapmak için tıklayınız.";
    final settingText = "Ayarlar";
    final warning2text =
        "Uygulamayı kullanabilmek için sunucu ayarlarını yapmalısınız.";

    return Scaffold(
      backgroundColor: AppColors.borderColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(200),
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/serdivan.png',
                  width: 150,
                  height: 150,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                warning2text,
                textAlign: TextAlign.center,
                style:
                    TextStyle(color: AppColors.backgroundColor, fontSize: 30),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 80, left: 20, right: 20, bottom: 20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.orange,
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        warningText,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColors.backgroundColor,
                          fontSize: 27,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                        child: SizedBox(
                          height: 50,
                          width: 100,
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: Text(
                              settingText,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

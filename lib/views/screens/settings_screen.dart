import 'package:archive_app/utils/app_colors.dart';
import 'package:archive_app/utils/app_pading.dart';
import 'package:archive_app/views/screens/login_screen.dart';
import 'package:archive_app/views/screens/server_control_screen.dart';
import 'package:archive_app/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SettingPage extends StatelessWidget {
  final box = GetStorage(); // GetStorage instance
  final TextEditingController _controller = TextEditingController();
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.borderColor,
      appBar: AppBar(
        title: Text('Sunucu Ayarları'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomTextFormField(
                labelText: "Sunucu IP",
                backgroundColor: AppColors.backgroundColor,
                controller: _controller,
              ),
            ),
            Padding(
              padding: AppPaddings.all20,
              child: ElevatedButton(
                onPressed: () {
                  // Sunucu ayarlarını kaydet
                  if (_controller.text.isNotEmpty) {
                    box.write('serverIP', _controller.text);

                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
                child: SizedBox(
                  height: 50,
                  width: 100,
                  child: Padding(
                    padding: AppPaddings.all16,
                    child: Text(
                      'Kaydet',
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
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

import 'package:archive_app/utils/app_colors.dart';
import 'package:archive_app/utils/app_pading.dart';
import 'package:archive_app/views/screens/login_screen.dart';
import 'package:archive_app/views/screens/server_control_screen.dart';
import 'package:archive_app/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class SettingPage extends StatelessWidget {
  final box = GetStorage(); // GetStorage instance
  final TextEditingController controller = TextEditingController();
  final TextEditingController Port_controller = TextEditingController();
  SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.borderColor,
      appBar: AppBar(
        title: Text('Sunucu Ayarları'),
      ),
      body: SingleChildScrollView(
        child: Center(
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
                padding: const EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                          labelText: "Sunucu IP",
                          backgroundColor: AppColors.backgroundColor,
                          controller: controller,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CustomTextFormField(
                          controller: Port_controller,
                          labelText: "Port",
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: AppPaddings.all20,
                child: ElevatedButton(
                  onPressed: () {
                    // Sunucu ayarlarını kaydet
                    if (controller.text.isNotEmpty) {
                      box.write('serverIP', controller.text);

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
    );
  }
}

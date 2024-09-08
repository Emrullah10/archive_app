import 'package:archive_app/utils/app_pading.dart';
import 'package:archive_app/views/screens/home_screen.dart';
import 'package:archive_app/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final TextEditingController _Emailcontroller = TextEditingController();
  final TextEditingController _Passwordcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 150),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Padding(
                padding: AppPaddings.all16,
                child: CustomTextFormField(
                  labelText: 'Kullanıcı Adı',
                  controller: _Emailcontroller,
                ),
              ),
              Padding(
                padding: AppPaddings.all16,
                child: CustomTextFormField(
                  labelText: 'Şifre',
                  isObscure: true,
                  controller: _Passwordcontroller,
                ),
              ),
              Padding(
                padding: AppPaddings.all16,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const SizedBox(
                    height: 50,
                    width: 100,
                    child: Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Text(
                        'Giriş',
                        textAlign: TextAlign.center,
                      ),
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

import 'package:archive_app/utils/app_pading.dart';
import 'package:archive_app/viewmodel/api_provider.dart';
import 'package:archive_app/views/screens/home_screen.dart';
import 'package:archive_app/views/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// AuthViewModel'i çağırıyoruz

class LoginPage extends ConsumerWidget {
  LoginPage({super.key});

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authViewModelProvider);
    final authNotifier = ref.read(authViewModelProvider.notifier);

    return Scaffold(
      resizeToAvoidBottomInset: true,
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
                padding:
                    EdgeInsets.only(top: 130, left: 16, right: 16, bottom: 16),
                child: CustomTextFormField(
                  labelText: 'Kullanıcı Adı',
                  controller: _emailController,
                ),
              ),
              Padding(
                padding: AppPaddings.all16,
                child: CustomTextFormField(
                  labelText: 'Şifre',
                  isObscure: true,
                  controller: _passwordController,
                ),
              ),
              Padding(
                padding: AppPaddings.all16,
                child: ElevatedButton(
                  onPressed: () {
                    // Giriş işlemi burada başlatılıyor
                    // await authNotifier.login(_emailController.text,
                    //     _passwordController.text, context);
                    Navigator.pushNamed(context, '/home');
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
              if (authState != null)
                Padding(
                  padding: AppPaddings.all16,
                  child: Text(
                    'Giriş başarısız! Lütfen bilgilerinizi kontrol edin.',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}

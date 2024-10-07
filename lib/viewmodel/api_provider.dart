import 'package:archive_app/models/modal/auth_modal.dart';
import 'package:archive_app/models/services/auth_service.dart';
import 'package:archive_app/views/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthViewModel extends StateNotifier<AuthModel?> {
  final AuthService _authService;


  AuthViewModel(this._authService) : super(null);

  Future<void> login(String email, String password,context) async {
    try {
      final authModel = await _authService.login(email, password,context);
      
      if (authModel == null) {
        
        return;
      }
      state = authModel;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } catch (e) {
      print('Login error: $e');
    }
  }
}

final authViewModelProvider = StateNotifierProvider<AuthViewModel, AuthModel?>((ref) {
  return AuthViewModel(AuthService());
});

import 'dart:convert';
import 'package:archive_app/models/modal/auth_modal.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
// AuthModel'in olduğu dosya

class AuthService {
  final String baseUrl = 'https://46.221.52.7:7001/api/auth';

  Future<AuthModel?> login(String email, String password, context) async {
    final response = await http.post(
      Uri.parse(baseUrl),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'userNameOrEmail': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
     
      final data = jsonDecode(response.body);
      return AuthModel.fromJson(data);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login failed'),
        ),
      );
      return null;
    }
  }
}

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:archive_app/models/modal/archive_modal.dart';

class ArchiveService {
  final baseUrl = 'https://reqres.in/api/users?page=2';
  Future<UserModel> fetchusers() async {
    final response = await http.get(Uri.parse(baseUrl));
    if (response.statusCode == 200) {
      var jsonbody = userModelFromJson(response.body);
      return jsonbody;
    }else{
     throw Exception('Failed to load users');
    }
  }
}

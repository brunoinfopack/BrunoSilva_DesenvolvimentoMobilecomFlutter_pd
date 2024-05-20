import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AuthProvider extends ChangeNotifier {
  String? message;
  String? token;
  final _url = 'https://identitytoolkit.googleapis.com/v1/';
  final _resource = 'accounts:signUp?key='; //signInWithPassword
  final _apiKey = 'AIzaSyBCZUJbyb2lVokIM_hxIVlFjdjW9M35Yv8';

  Future<bool> signUp(String email, String password) async {
    String sUri = '$_url$_resource$_apiKey';
    Uri uri = Uri.parse(sUri);
    var response = await http.post(uri, body: {
      'email': email,
      'password': password,
      'retornarSecureToken': 'true'
    });

    if (response.statusCode == 200) {
      var resp = jsonDecode(response.body);
      token = resp["idToken"];
      return true;
    } else {
      message = "Erro ao cadastrar";
      return false;
    }
  }
}

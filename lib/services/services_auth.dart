import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart' as http;

class AuthService extends ChangeNotifier {
  final String _baseUrl = 'identitytoolkit.googleapis.com';
  final String _firebaseKey = 'AIzaSyCjSJQ0yqdLtBAwSWqR0RGFzQaKlSIgODw';
  final storage = const FlutterSecureStorage();

  //////registrar usuario////////////
  Future<String?> createUser(String email, String password) async {
    final Map<String, dynamic> authdata = {
      'email': email,
      'password': password,
    };
    final url =
        Uri.https(_baseUrl, '/v1/accounts:signUp', {'key': _firebaseKey});
    final response = await http.post(url, body: json.encode(authdata));
    final Map<String, dynamic> decodeResponse = json.decode(response.body);
    if (decodeResponse.containsKey('idToken')) {
      storage.write(key: 'token', value: decodeResponse['idtoken']);
      return null;
    } else {
      return decodeResponse['error']['message'];
    }
  }

  ////////////
  Future<String?> login(String email, String password) async {
    final Map<String, dynamic> authdata = {
      'email': email,
      'password': password,
    };
    final url = Uri.https(
        _baseUrl, '/v1/accounts:signInWithPassword', {'key': _firebaseKey});
    final response = await http.post(url, body: json.encode(authdata));
    final Map<String, dynamic> decodeResponse = json.decode(response.body);
    if (decodeResponse.containsKey('idToken')) {
      storage.write(key: 'token', value: decodeResponse['idToken']);
      return null;
    } else {
      return decodeResponse['error']['message'];
    }
  }

  //////////cerrar sesion///////
  Future logOut() async {
    await storage.delete(key: 'token');
    return;
  }
}

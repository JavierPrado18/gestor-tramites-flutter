import 'package:flutter/material.dart';

class ProviderLogin extends ChangeNotifier {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String telefono="";
  String img="";
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set isLoading(bool isloading) {
    _isLoading = isloading;
    notifyListeners();
  }

  bool isValidForm() {
    return formKey.currentState?.validate() ?? false;
  }
}

import 'package:flutter/material.dart';

class RegisterFormProvider extends ChangeNotifier {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String name = '';

  validateForm() {
    if (formkey.currentState!.validate()) {
      print('Form valid... Login');
      print('$email == $password == $name');
      return true;
    } else {
      print('Form not valid');
      return false;
    }
  }
}

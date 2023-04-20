import 'package:get/get.dart';
import 'package:hello_flutter/models/login_model.dart';

class LoginController extends GetxController {
  LoginCredentialsItem loginItem = LoginCredentialsItem(
      username: '', password: '', usernameError: '', passwordError: '');

  onChangeUsername(String value) {
    loginItem.username = value;
    update();
  }

  onChangePassword(String value) {
    loginItem.password = value;
    update();
  }

  checkCredentials() {
    if (loginItem.username.isEmpty) {
      loginItem.usernameError = 'Username is required';
    } else {
      loginItem.usernameError = '';
    }
    if (loginItem.password.isEmpty) {
      loginItem.passwordError = 'Password is required';
    } else {
      loginItem.passwordError = '';
    }
    update();
  }
}

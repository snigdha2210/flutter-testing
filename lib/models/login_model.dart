class LoginCredentialsItem {
  String username;
  String password;
  String usernameError;
  String passwordError;

  LoginCredentialsItem(
      {this.username = '',
      this.password = '',
      this.passwordError = '',
      this.usernameError = ''});
}

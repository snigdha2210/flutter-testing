import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hello_flutter/controllers/login_controller.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';

  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginController());
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double heightTop;
    return SafeArea(
      child: Scaffold(
          body: Container(
        color: Colors.blue,
        child: Column(
          children: [
            Container(
              color: Colors.blue,
              alignment: Alignment.center,
              padding: EdgeInsets.fromLTRB(0, 100, 0, 100),
              width: width,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.asset(
                  'assets/logo.png',
                  height: 100,
                ),
              ),
            ),
            Expanded(
              child: Container(
                width: width,
                // height: height,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Text(
                        'Login',
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                      SizedBox(height: 40),
                      Container(
                        width: 300,
                        child: GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (loginController) {
                              return TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                autofocus: false,
                                initialValue: '',
                                onChanged: (value) =>
                                    loginController.onChangeUsername(value),
                                decoration: InputDecoration(
                                  labelText: "Username",
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  hintText: 'Username',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.yellow.shade700,
                                          width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                ),
                              );
                            }),
                      ),
                      GetBuilder<LoginController>(
                          init: LoginController(),
                          builder: (loginController) {
                            return loginController
                                    .loginItem.usernameError.isNotEmpty
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.fromLTRB(2, 8, 0, 0),
                                    width: 300,
                                    child: Text(
                                        loginController.loginItem.usernameError,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)),
                                  )
                                : Container();
                          }),
                      SizedBox(height: 10),
                      Container(
                        width: 300,
                        child: GetBuilder<LoginController>(
                            init: LoginController(),
                            builder: (loginController) {
                              return TextFormField(
                                autofocus: false,
                                initialValue: '',
                                onChanged: (value) =>
                                    loginController.onChangePassword(value),
                                obscureText: true,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  filled: true,
                                  fillColor: Colors.grey.shade200,
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  disabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.transparent,
                                          width: 2.0)),
                                  focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.yellow.shade700,
                                          width: 2.0),
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  hintText: 'Password',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                ),
                              );
                            }),
                      ),
                      GetBuilder<LoginController>(
                          init: LoginController(),
                          builder: (loginController) {
                            return loginController
                                    .loginItem.passwordError.isNotEmpty
                                ? Container(
                                    alignment: Alignment.centerLeft,
                                    margin: EdgeInsets.fromLTRB(2, 8, 0, 0),
                                    width: 300,
                                    child: Text(
                                        loginController.loginItem.passwordError,
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500)))
                                : Container();
                          }),
                      SizedBox(height: 20),
                      GetBuilder<LoginController>(
                          init: LoginController(),
                          builder: (loginController) {
                            return Container(
                              width: 300,
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 16.0),
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    padding: EdgeInsets.all(12),
                                    backgroundColor: Colors.green,
                                  ),
                                  onPressed: () {
                                    loginController.checkCredentials();
                                  },
                                  child: Text('LOG IN',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 18)),
                                ),
                              ),
                            );
                          }),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}

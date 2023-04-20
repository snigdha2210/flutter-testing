# Flutter Login Screen

## Environment

- Flutter Version: 3.7.11

## Application Demo:

![](https://hrcdn.net/s3_pub/istreet-assets/ynA5AomE9gODXvuAdcT4hA/react-native-login-screen.gif)

## Functionality Requirements

Create a login screen, as shown above. Application requirements are given below, and the finished application must pass all of the unit tests.

Your task is to complete the implementation of `lib/main.dart` according to the following requirements:

- The login screen contains two inputs, username and password, and a Login Button.
- Clicking on Login Button should trigger the validation on the form.
- The Username input field is required. If the submit button is clicked and the username field is empty, the message `Username is required` should be rendered on the screen. Else, no error message should be rendered.
- The Password input field is required. If the submit button is clicked and the password field is empty, the message `Password is required` should be rendered on the screen. Else, no error message should be rendered.
- If both the inputs are not empty, no error messages should be rendered.

Initially, the file is filled with boilerplate code.

## Testing Requirements

- The "Username" input widget must use TextFormField class.
- The "Password" input widget must use TextFormField class.
- The "Login" button widget must use ElevatedButton class.

Please note that the widgets use the above classes for test cases for rendering purposes. It is advised not to change them.

## Project Specifications

**Read Only Files**

- `test/main_test.dart`

**Commands**

```bash
flutter run --no-sound-null-safety
```

- install:

```bash
flutter pub  get
```

- test:

```bash
flutter test --no-sound-null-safety test/main_test.dart
```

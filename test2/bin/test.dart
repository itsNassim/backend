import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  //var response =await http.get(Uri.parse("http://127.0.0.1:8000/core/"));
  //var response = await http.post(Uri.parse("http://127.0.0.1:8000/core/"),
//      body: {"username": "nassim", "email": "a@gmail.com", "password": "123"});
  AuthService authService = AuthService();
  RegistrationResponse? registrationResponse = await authService.registration(
      "nassim10", "17nl626765", "17nl626765", "0478afb0f1d@emailbbox.pro");
  if (registrationResponse != null) {
    if (registrationResponse.email != null) {
      registrationResponse.email!.forEach((element) {
        print(element);
      });
    }
    if (registrationResponse.username != null) {
      registrationResponse.username!.forEach((element) {
        print(element);
      });
    }
    if (registrationResponse.non_field_errors != null) {
      registrationResponse.non_field_errors!.forEach((element) {
        print(element);
      });
    }
    if (registrationResponse.password1 != null) {
      registrationResponse.password1!.forEach((element) {
        print(element);
      });
    }
    if (registrationResponse.key != null) {
      print(registrationResponse.key!);
    }
  }
}

class AuthService {
  final registrationUri = Uri.parse("http://127.0.0.1:8000/registration/");

  Future<RegistrationResponse?> registration(
      String username, String password1, String password2, String email) async {
    var response = await http.post(registrationUri, body: {
      "username": username,
      "password1": password1,
      "password2": password2,
      "email": email,
    });
    print(response.body);
    return RegistrationResponse.formJson(jsonDecode(response.body));
  }
}

//response for error {"username": ["A user with that username already exists."]}

//password for error{"password1": ["This password is too short. It must contain at least 8 characters.","This password is too common.","This password is entirely numeric."]}

//non field error {"non_field_errors": ["The two password fields didn't match."]}

class RegistrationResponse {
  List<dynamic>? non_field_errors;
  List<dynamic>? password1;
  List<dynamic>? username;
  List<dynamic>? email;
  dynamic? key;

  RegistrationResponse(
      {this.email,
      this.key,
      this.non_field_errors,
      this.password1,
      this.username});

  factory RegistrationResponse.formJson(mapOfBody) {
    return RegistrationResponse(
      email: mapOfBody["email"],
      key: mapOfBody["key"],
      non_field_errors: mapOfBody["non_field_errors"],
      password1: mapOfBody["password1"],
      username: mapOfBody["username"],
    );
  }
}

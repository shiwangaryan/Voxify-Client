import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:voxify_client/utils/constants.dart';

Future<String> registerUserAPI(String username, String email, String password,
    String profilePicName) async {
  final registerUserURI = Uri.parse('$baseApiUrl/auth/register');

  final response = await http.post(
    registerUserURI,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({
      "username": username,
      "email": email,
      "password": password,
      "profilePicName": profilePicName
    }),
  );

  if (response.statusCode == 201) {
    return "true";
  } else {
    print(
        "Error in registering user: ${json.decode(response.body)['message']}");
    return json.decode(response.body)['message'];
  }
}

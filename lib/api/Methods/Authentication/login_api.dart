import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:voxify_client/utils/constants.dart';

Future<String> loginUsernameAPI(String username) async {
  final loginUserURI = Uri.parse('$baseApiUrl/auth/login/verifyUsername');

  final response = await http.post(
    loginUserURI,
    headers: {'Content-Type': 'application/json'},
    body: json.encode({"username": username}),
  );

  print('Response: ${response.body}');
  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    final userId = data['userId'];
    print('userId: $userId');
    return userId;
  } else if (response.statusCode == 401) {
    return "Email not verified, check you mail";
  } else if (response.statusCode == 404) {
    print('Username not found');
    return "Username not found";
  } else {
    print('Error: ${response.body}');
    return "Try again in few minutes";
  }
}

Future<String> loginPasswordAPI(String userId, String password) async {
  final loginUserURI = Uri.parse('$baseApiUrl/auth/login/verifyPassword');

  final response = await http.post(
    loginUserURI,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(
      {"userId": userId, "password": password},
    ),
  );

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    final token = data['token'];
    final storage = GetStorage();
    await storage.write('profilePicName', data['profilePicName']);

    print("jwtToken: $token");
    return token;
  } else if (response.statusCode == 404) {
    print('Password not matched');
    return "";
  } else {
    print('Error: ${response.body}');
    return "";
  }
}

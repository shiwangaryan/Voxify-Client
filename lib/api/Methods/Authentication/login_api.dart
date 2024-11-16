import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:voxify_client/utils/constants.dart';

Future<String> loginUserAPI(String username, String password) async {
  final loginUserURI = Uri.parse('$baseApiUrl/auth/login');

  final response = await http.post(loginUserURI,
      headers: {'Content-Type': 'application/json'},
      body: json.encode({'username': username, 'password': password}));

  if (response.statusCode == 200) {
    var data = json.decode(response.body);
    final jwtToken = data['token'];
    return jwtToken;
  }
  else if(response.statusCode== 401 || response.statusCode== 404) {
    return "Invalid credentials";
  }
  else {
    return 'Error: ${json.decode(response.body)["message"]}';
  }
}

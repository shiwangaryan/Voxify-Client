import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:voxify_client/api/Models/Authentication/user_model.dart';
import 'package:voxify_client/utils/constants.dart';

Future<bool> registerUserAPI(UserModel user) async {
  final registerUserURI = Uri.parse('$baseApiUrl/auth/register');

  final response = await http.post(
    registerUserURI,
    headers: {'Content-Type': 'application/json'},
    body: json.encode(user.toJson()),
  );

  if(response.statusCode== 201) {
    return true;
  }
  else {
    print("Error in registering user: ${json.decode(response.body)['message']}");
    return false;
  }
}

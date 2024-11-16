import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  FocusNode username = FocusNode();
  FocusNode password = FocusNode();

  @override
  void dispose() {
    username.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextFormField(
            focusNode: username,
            decoration: const InputDecoration(
              hintText: 'Username',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 20),
          TextFormField(
            focusNode: password,
            decoration: const InputDecoration(
              hintText: 'Password',
              border: OutlineInputBorder(),
            ),
            keyboardType: TextInputType.text,
          ),
          const SizedBox(height: 20),
          TextButton(
            onPressed: () {
              username.unfocus();
              password.unfocus();
            },
            child: Text('Change focus'),
          )
        ],
      ),
    );
  }
}

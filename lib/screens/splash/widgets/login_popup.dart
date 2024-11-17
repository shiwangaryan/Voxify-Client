import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voxify_client/services/bloc/auth_popup/auth_popup_bloc.dart';

class LoginPopup extends StatefulWidget {
  const LoginPopup({super.key});

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup> {
  bool loginPopup = false;
  TextEditingController usernameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<AuthPopupBloc, AuthPopupState>(
      buildWhen: (previous, current) {
        if (current is AuthPopupStateChange) {
          if (current.index == 1) {
            setState(() {
              loginPopup = true;
            });
            return true;
          } else if (current.index == 0) {
            setState(() {
              loginPopup = false;
            });
            return true;
          }
          return false;
        } else {
          return false;
        }
      },
      builder: (context, state) {
        return AnimatedContainer(
          curve: Curves.easeInOut,
          duration: const Duration(milliseconds: 300),
          height: loginPopup ? height * 0.48 : 0,
          decoration: const BoxDecoration(
            color: const Color(0xff0f101b),
            // color: Colors.black,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
                vertical: height * 0.05, horizontal: width * 0.12),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SvgPicture.asset(
                    'assets/images/logo.svg',
                    height: 50,
                    color: Colors.teal[300],
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    'Continue with username',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: Colors.white.withOpacity(0.6),
                    ),
                  ),
                  const SizedBox(height: 26),
                  TextField(
                    maxLength: 40,
                    cursorColor: Colors.teal[100],
                    decoration: InputDecoration(
                      counterText: '',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(
                          color: Colors.teal[100]!,
                        ),
                      ),
                      hintText: 'Username',
                      hintStyle: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 15,
                      ),
                    ),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                    controller: usernameController,
                  ),
                  const SizedBox(height: 26),
                  InkWell(
                    onTap: () {
                      FocusScope.of(context).unfocus();
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        color: Colors.teal[400],
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(
                        child: Text(
                          'Next',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

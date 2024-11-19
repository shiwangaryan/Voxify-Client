import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:voxify_client/api/Methods/Authentication/login_api.dart';
import 'package:voxify_client/services/bloc/auth_popup/auth_popup_bloc.dart';

class LoginPopup extends StatefulWidget {
  final void Function() registrationCallback;
  const LoginPopup({super.key, required this.registrationCallback});

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup>
    with SingleTickerProviderStateMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController realNameController = TextEditingController();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();
  bool loginPopup = false;
  bool usernameCorrect = false;
  bool isRegistrationSelected = false;
  bool showLogin = true;
  bool enteredWrongUsername = false;
  bool enteredWrongPassword = false;
  String userId = '';

  //animation ------
  late AnimationController _animationController;
  late Animation<Offset> _usernameOffset;
  late Animation<Offset> _passwordOffset;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    );
    _usernameOffset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-1.5, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _passwordOffset = Tween<Offset>(
      begin: const Offset(1.5, 0),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    usernameCorrect = false;
    _animationController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    realNameController.dispose();
    super.dispose();
  }

  int _validateForm() {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (usernameController.text.isEmpty) {
      return 0;
    } else if (emailController.text.isEmpty) {
      return 0;
    } else if (!emailRegex.hasMatch(emailController.text)) {
      return -1;
    } else if (passwordController.text.isEmpty) {
      return 0;
    } else if (realNameController.text.isEmpty) {
      return 0;
    }
    return 1;
  }

  // --- function to clear when clicking back or submit or signin
  void clearFields() {
    passwordController.clear();
    emailController.clear();
    realNameController.clear();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
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
              usernameCorrect = false;
            });
            _animationController.reverse();
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
          duration: const Duration(milliseconds: 200),
          height: loginPopup
              ? isRegistrationSelected
                  ? height
                  : max(400, height * 0.48)
              : 0,
          decoration: BoxDecoration(
            color: const Color(0xff0f101b),
            gradient: isRegistrationSelected
                ? const RadialGradient(
                    colors: [Color(0xFF383A45), Color(0xff0f101b)],
                    stops: [0.15, 1],
                    radius: 0.92,
                    center: Alignment.topLeft,
                  )
                : const RadialGradient(
                    colors: [Color(0xff0f101b), Color(0xff0f101b)],
                    stops: [0.15, 1],
                    radius: 0.92,
                    center: Alignment.topLeft,
                  ),
            borderRadius: isRegistrationSelected
                ? BorderRadius.circular(0)
                : const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40),
                  ),
          ),
          child: Padding(
            padding: isRegistrationSelected
                ? EdgeInsets.only(
                    left: width * 0.05,
                    right: width * 0.05,
                    top: height * 0.055,
                  )
                : EdgeInsets.only(
                    top: height * 0.05,
                    left: width * 0.12,
                    right: width * 0.12,
                    bottom: height * 0.03,
                  ),
            child: SingleChildScrollView(
              child: isRegistrationSelected
                  // ------ REGISTRATION POPUP
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // --- back icon
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async {
                                clearFields();
                                FocusScope.of(context).unfocus();
                                setState(() {
                                  isRegistrationSelected = false;
                                });
                                await Future.delayed(
                                    const Duration(milliseconds: 180));
                                setState(() {
                                  showLogin = true;
                                });
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent,
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.8),
                                    width: 2.5,
                                  ),
                                ),
                                padding: const EdgeInsets.only(
                                    top: 7, left: 8, bottom: 7),
                                child: Center(
                                  child: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white.withOpacity(0.8),
                                    size: 20,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: height * 0.05),
                        // --- icon, create an acc & signup with
                        SvgPicture.asset(
                          'assets/images/logo.svg',
                          color: Colors.teal[300],
                          height: 70,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          'Create an\naccount',
                          style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.4,
                            height: 0.9,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.016),
                        Text(
                          'Sign up with email',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white.withOpacity(0.6),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: height * 0.06),

                        // --- text form ---
                        BuildFormField(
                          name: 'Username',
                          textController: usernameController,
                        ),
                        const SizedBox(height: 14),
                        BuildFormField(
                          name: 'Email',
                          textController: emailController,
                        ),
                        const SizedBox(height: 14),
                        BuildPasswordFormField(
                          passwordController: passwordController,
                        ),
                        const SizedBox(height: 14),
                        BuildFormField(
                          name: 'Real Name',
                          textController: realNameController,
                        ),
                        const SizedBox(height: 36),

                        // --- submit button ---
                        InkWell(
                          onTap: () async {
                            FocusScope.of(context).unfocus();
                            int validate =
                                _validateForm(); // 1 means true, 0 means empty field,
                            //-1 means field is not valid
                            if (validate == 1) {
                              clearFields();
                              setState(() {
                                isRegistrationSelected = false;
                              });
                              await Future.delayed(
                                  const Duration(milliseconds: 180));
                              setState(() {
                                showLogin = true;
                              });
                              await Future.delayed(
                                  const Duration(milliseconds: 170));
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: const Text(
                                    'Account created successfully',
                                    style: TextStyle(
                                      fontSize: 15.3,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  backgroundColor: Colors.teal[700],
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    validate == 0
                                        ? 'Fields cannot be empty'
                                        : 'Enter valid email id',
                                    style: const TextStyle(
                                      fontSize: 15.3,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // backgroundColor: Colors.red[600],
                                  backgroundColor: Colors.redAccent,
                                  duration: const Duration(seconds: 2),
                                ),
                              );
                            }
                          },
                          child: Container(
                            height: 55,
                            width: 200,
                            decoration: BoxDecoration(
                              color: Colors.teal[400],
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: const Center(
                              child: Text(
                                'Register',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // --- sign in ---
                        GestureDetector(
                          onTap: () async {
                            clearFields();
                            FocusScope.of(context).unfocus();
                            setState(() {
                              isRegistrationSelected = false;
                            });
                            await Future.delayed(
                                const Duration(milliseconds: 180));
                            setState(() {
                              showLogin = true;
                            });
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'already have an account?',
                                style: TextStyle(
                                  fontSize: 12.5,
                                  color: Colors.blue[200],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: keyboardHeight),
                      ],
                    )
                  :
                  // ------ LOGIN POPUP
                  AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: showLogin ? 1 : 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                'assets/images/logo.svg',
                                height: 50,
                                color: Colors.teal[300],
                              ),
                              const Spacer(),
                              usernameCorrect
                                  ? InkWell(
                                      onTap: () {
                                        FocusScope.of(context).unfocus();
                                        if (usernameCorrect) {
                                          _animationController.reverse();
                                          setState(() {
                                            usernameCorrect = false;
                                          });
                                        }
                                      },
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent,
                                          border: Border.all(
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            width: 2.5,
                                          ),
                                        ),
                                        padding: const EdgeInsets.only(
                                            top: 7, left: 8, bottom: 7),
                                        child: Center(
                                          child: Icon(
                                            Icons.arrow_back_ios,
                                            color:
                                                Colors.white.withOpacity(0.8),
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(height: 26),
                          const Text(
                            'Login',
                            style: TextStyle(
                              fontSize: 34,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            !usernameCorrect
                                ? 'Continue with username'
                                : 'Enter your password',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 80,
                            child: Form(
                              key: _loginFormKey,
                              child: Stack(
                                children: [
                                  // ---- USERNAME INPUT -----
                                  SlideTransition(
                                    position: _usernameOffset,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        TextFormField(
                                          validator: (value) {
                                            if (usernameCorrect ||
                                                value!.isNotEmpty) {
                                              return null;
                                            }
                                            return 'Username cannot be empty';
                                          },
                                          maxLength: 40,
                                          cursorColor: Colors.teal[100],
                                          decoration: InputDecoration(
                                            counterText: '',
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.teal[100]!,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color:
                                                    Colors.red.withOpacity(0.6),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color:
                                                    Colors.red.withOpacity(0.6),
                                              ),
                                            ),
                                            hintText: 'Username',
                                            hintStyle: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontSize: 15,
                                            ),
                                          ),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                          controller: usernameController,
                                        ),
                                        const SizedBox(height: 4),
                                        enteredWrongUsername
                                            ? Text(
                                                ' Incorrect username',
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  color: Colors.red[400],
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                  ),
                                  // ---- PASSWORD INPUT -----
                                  SlideTransition(
                                    position: _passwordOffset,
                                    child: Column(
                                      children: [
                                        TextFormField(
                                          validator: (value) {
                                            if (!usernameCorrect ||
                                                value!.isNotEmpty) {
                                              return null;
                                            }
                                            return 'Password cannot be empty';
                                          },
                                          maxLength: 40,
                                          cursorColor: Colors.teal[100],
                                          decoration: InputDecoration(
                                            counterText: '',
                                            enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.white
                                                    .withOpacity(0.4),
                                              ),
                                            ),
                                            focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.teal[100]!,
                                              ),
                                            ),
                                            errorBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color:
                                                    Colors.red.withOpacity(0.6),
                                              ),
                                            ),
                                            focusedErrorBorder:
                                                OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                color: Colors.red.withOpacity(
                                                    0.6), // Same as errorBorder for focus
                                              ),
                                            ),
                                            hintText: 'Password',
                                            hintStyle: TextStyle(
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              fontSize: 15,
                                            ),
                                          ),
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                          ),
                                          controller: passwordController,
                                        ),
                                        const SizedBox(height: 4),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            enteredWrongPassword
                                                ? Text(
                                                    ' Incorrect password',
                                                    style: TextStyle(
                                                      fontSize: 11,
                                                      color: Colors.red[400],
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            const Spacer(),
                                            Text(
                                              'Forgot password?',
                                              style: TextStyle(
                                                fontSize: 11,
                                                color: Colors.blue[200],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          usernameCorrect
                              ? const SizedBox(height: 16)
                              : const SizedBox(height: 10),
                          InkWell(
                            onTap: () async {
                              FocusScope.of(context).unfocus();
                              if (_loginFormKey.currentState!.validate()) {
                                if (usernameCorrect == false) {
                                  // verify Username API
                                  userId = await loginUsernameAPI(
                                    usernameController.text,
                                  );
                                  if (userId != "") usernameCorrect = true;

                                  if (usernameCorrect) {
                                    _animationController.forward();
                                    setState(() {
                                      usernameCorrect = true;
                                    });
                                    enteredWrongUsername = false;
                                  } else {
                                    setState(() {
                                      enteredWrongUsername = true;
                                    });
                                  }
                                } else {
                                  final token = await loginPasswordAPI(
                                    userId,
                                    passwordController.text,
                                  );

                                  if (token != "") {
                                    setState(() {
                                      enteredWrongPassword = true;
                                    });
                                  } else {
                                    enteredWrongPassword = false;
                                    // navigate to home screen
                                  }
                                }
                              }
                            },
                            child: Container(
                              height: 55,
                              decoration: BoxDecoration(
                                color: Colors.teal[400],
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  !usernameCorrect ? 'Next' : 'Login',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () {
                              clearFields();
                              widget.registrationCallback();
                              setState(() {
                                showLogin = false;
                                isRegistrationSelected = true;
                              });
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Create new account?',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.blue[200],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
            ),
          ),
        );
      },
    );
  }
}

class BuildFormField extends StatelessWidget {
  final TextEditingController textController;
  final String name;
  const BuildFormField({
    super.key,
    required this.textController,
    required this.name,
  });

  String hintText() {
    if (name == 'Username') {
      return '  username';
    } else if (name == 'Email') {
      return '  example@mail.com';
    } else {
      return '  your name (not public)';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 110,
          child: Text(
            name,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: TextFormField(
            controller: textController,
            keyboardType: name == 'Email'
                ? TextInputType.emailAddress
                : TextInputType.text,
            textCapitalization: name == 'Real Name'
                ? TextCapitalization.words
                : TextCapitalization.none,
            decoration: InputDecoration(
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blueGrey.withOpacity(0.68),
                  width: 1.6,
                ),
              ),
              focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.teal[300]!,
                  width: 1.4,
                ),
              ),
              hintStyle: TextStyle(
                color: Colors.blueGrey.withOpacity(0.3),
                fontSize: 15,
              ),
              hintText: hintText(),
            ),
            cursorColor: Colors.teal[300],
            style: TextStyle(
              color: Colors.white.withOpacity(0.85),
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        )
      ],
    );
  }
}

class BuildPasswordFormField extends StatefulWidget {
  final TextEditingController passwordController;
  const BuildPasswordFormField({super.key, required this.passwordController});

  @override
  State<BuildPasswordFormField> createState() => _BuildPasswordFormFieldState();
}

class _BuildPasswordFormFieldState extends State<BuildPasswordFormField> {
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          width: 110,
          child: Text(
            'Password',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: InkWell(
            child: TextFormField(
              obscureText: !showPassword,
              controller: widget.passwordController,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.blueGrey.withOpacity(0.68),
                    width: 1.6,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.teal[300]!,
                    width: 1.4,
                  ),
                ),
                hintStyle: TextStyle(
                  color: Colors.blueGrey.withOpacity(0.3),
                  fontSize: 15,
                ),
                hintText: showPassword ? '  password' : '  xxxxxxxx',
                suffixIcon: GestureDetector(
                  onTap: () {
                    setState(() {
                      showPassword = !showPassword;
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.zero,
                    child: Icon(
                      showPassword
                          ? Symbols.visibility_sharp
                          : Symbols.visibility_off_sharp,
                      color: Colors.blueGrey.withOpacity(0.3),
                    ),
                  ),
                ),
                suffixIconConstraints: const BoxConstraints(
                  minWidth: 46,
                  minHeight: 0,
                ),
                focusColor: Colors.teal[300],
              ),
              cursorColor: Colors.teal[300],
              style: TextStyle(
                color: Colors.white.withOpacity(0.85),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:voxify_client/services/bloc/auth_popup/auth_popup_bloc.dart';

class LoginPopup extends StatefulWidget {
  const LoginPopup({super.key});

  @override
  State<LoginPopup> createState() => _LoginPopupState();
}

class _LoginPopupState extends State<LoginPopup>
    with SingleTickerProviderStateMixin {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController realNameController = TextEditingController();
  bool loginPopup = false;
  bool usernameCorrect = false;
  bool isRegistrationSelected = false;
  bool showLogin = true;

  //animation ------
  late AnimationController _animationController;
  late Animation<Offset> _usernameOffset;
  late Animation<Offset> _passwordOffset;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _usernameOffset = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(-2, 0),
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
    _passwordOffset = Tween<Offset>(
      begin: const Offset(2, 0),
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
    if (usernameController.text.isEmpty) {
      print('username is empty');
      return 0;
    } else if (emailController.text.isEmpty) {
      print('email is empty');
      return 0;
    } else if (passwordController.text.isEmpty) {
      print('password is empty');
      return 0;
    } else if (realNameController.text.isEmpty) {
      print('real name is empty');
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
        return SingleChildScrollView(
          child: AnimatedContainer(
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 400),
            height: loginPopup
                ? isRegistrationSelected
                    ? height
                    : height * 0.48
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
                  ? EdgeInsets.symmetric(
                      horizontal: width * 0.06,
                      vertical: height * 0.055,
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
                                      const Duration(milliseconds: 270));
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
                          const SizedBox(height: 55),
                          // --- icon, create an acc & signup with
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            color: Colors.teal[300],
                            height: 70,
                          ),
                          // SvgPicture.asset(
                          //   'assets/images/headphone.svg',
                          //   height: 70,
                          // ),
                          const SizedBox(height: 25),
                          const Text(
                            'Create an\naccount',
                            style: TextStyle(
                              fontSize: 46,
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              letterSpacing: -0.4,
                              height: 0.9,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 24),
                          Text(
                            'Sign up with email',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.white.withOpacity(0.6),
                              fontWeight: FontWeight.w500,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: 50),

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
                                  _validateForm(); // 1 means true, 0 means empty field, -1 means field is not valid
                              if (validate == 1) {
                                clearFields();
                                setState(() {
                                  isRegistrationSelected = false;
                                });
                                await Future.delayed(
                                    const Duration(milliseconds: 270));
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
                              } else if (validate == 0) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text(
                                      'Fields cannot be empty',
                                      style: TextStyle(
                                        fontSize: 15.3,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    backgroundColor: Colors.redAccent[400],
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
                                  const Duration(milliseconds: 270));
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
                          )
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
                                fontSize: 35,
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
                                fontSize: 15,
                                fontWeight: FontWeight.w600,
                                color: Colors.white.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(height: 16),
                            SizedBox(
                              height: 75,
                              child: Stack(
                                children: [
                                  SlideTransition(
                                    position: _usernameOffset,
                                    child: TextField(
                                      maxLength: 40,
                                      cursorColor: Colors.teal[100],
                                      decoration: InputDecoration(
                                        counterText: '',
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide: BorderSide(
                                            color:
                                                Colors.white.withOpacity(0.4),
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                  ),
                                  SlideTransition(
                                    position: _passwordOffset,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        TextField(
                                          maxLength: 40,
                                          cursorColor: Colors.teal[100],
                                          decoration: InputDecoration(
                                            counterText: '',
                                            border: OutlineInputBorder(
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
                                        Text(
                                          'Forgot password?',
                                          style: TextStyle(
                                            fontSize: 11,
                                            color: Colors.blue[200],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 16),
                            InkWell(
                              onTap: () {
                                FocusScope.of(context).unfocus();
                                if (!usernameCorrect) {
                                  _animationController.forward();
                                  setState(() {
                                    usernameCorrect = true;
                                  });
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
              fontSize: 17,
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
              fontSize: 17,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
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
        )
      ],
    );
  }
}

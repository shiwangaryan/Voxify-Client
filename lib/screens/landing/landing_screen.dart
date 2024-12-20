import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voxify_client/screens/landing/widgets/get_started_button.dart';
import 'package:voxify_client/screens/landing/widgets/login_popup.dart';
import 'package:voxify_client/services/bloc/auth_popup/auth_popup_bloc.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool popupOpen = false;
  bool isRegistrationSelected = false;

  void toggleRegistrationCallback(bool value) {
    // to set the resizebottominset accoridngly
    setState(() {
      isRegistrationSelected = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return BlocBuilder<AuthPopupBloc, AuthPopupState>(
      buildWhen: (previous, current) {
        if (current is AuthPopupStateChange) {
          if (current.index == 1) {
            popupOpen = true;
            return true;
          } else if (current.index == 0) {
            popupOpen = false;
            return true;
          }
          return false;
        }
        return false;
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: isRegistrationSelected ? false : true,
          body: AnimatedContainer(
            duration: const Duration(milliseconds: 120),
            decoration: BoxDecoration(
              gradient: RadialGradient(
                colors: const [Color(0xFF383A45), Color(0xff0f101b)],
                stops: !popupOpen ? [0.15, 1] : [0.4, 1],
                radius: !popupOpen ? 0.95 : 1.9,
                center: Alignment.topLeft,
              ),
              color: const Color(0xff0f101b),
            ),
            child: Stack(
              children: [
                GestureDetector(
                  onTap: () async {
                    FocusScope.of(context).unfocus();
                    await Future.delayed(const Duration(milliseconds: 150));
                    if (popupOpen) {
                      context.read<AuthPopupBloc>().add(AuthPopupChangedTo(0));
                    }
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      popupOpen
                          ? SizedBox(height: height * 0.055)
                          : const SizedBox(height: 0),
                      popupOpen
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const SizedBox(width: 18),
                                InkWell(
                                  onTap: () async {
                                    FocusScope.of(context)
                                        .requestFocus(FocusNode());
                                    await Future.delayed(
                                        const Duration(milliseconds: 200));

                                    context
                                        .read<AuthPopupBloc>()
                                        .add(AuthPopupChangedTo(0));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.transparent,
                                      border: Border.all(
                                        color: Colors.white,
                                        width: 2.5,
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(5),
                                    child: const Center(
                                      child: Icon(
                                        Icons.close_rounded,
                                        color: Colors.white,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          : const SizedBox(),
                      popupOpen
                          ? const SizedBox(height: 50)
                          : SizedBox(height: height * 0.18),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        // width: popupOpen ? width * 0.9 : width * 0.98,
                        width: width * 0.98,
                        height: popupOpen ? height * 0.42 : height * 0.5,
                        transform: popupOpen
                            ? Matrix4.translationValues(0, -40, 0)
                            : Matrix4.translationValues(0, 0, 0),
                        child: SvgPicture.asset(
                          'assets/images/headphone.svg',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/images/logo.svg',
                            color: Colors.teal[300],
                            height: 60,
                          ),
                          const SizedBox(width: 12),
                          const Text(
                            'VOXIFY',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 46,
                              color: Colors.white,
                              letterSpacing: -1.7,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 6),
                      Text(
                        'start your podcast journey',
                        style: TextStyle(
                          fontWeight: FontWeight.w200,
                          fontSize: 15,
                          color: Colors.white.withOpacity(0.8),
                          wordSpacing: 2.5,
                        ),
                      ),
                      const SizedBox(height: 25),
                      const GestStartedButton(),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: LoginPopup(
                    registrationCallback: toggleRegistrationCallback,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

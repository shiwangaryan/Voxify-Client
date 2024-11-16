import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  bool buttonTapped = false;

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff454756), Color(0xff0f101b)],
          stops: [0.03, 0.28],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/headphone.svg',
              width: width * 0.98,
            ),
            const SizedBox(height: 30),
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
            const SizedBox(height: 8),
            Text(
              'start your podcast journey',
              style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 17,
                color: Colors.white.withOpacity(0.8),
                wordSpacing: 2.5,
              ),
            ),
            const SizedBox(height: 25),
            InkWell(
              onTap: () {
                setState(() {
                  buttonTapped = true;
                });
                Future.delayed(const Duration(milliseconds: 220), () {
                  setState(() {
                    buttonTapped= false;
                  });
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 220),
                width: 170,
                height: 50,
                decoration: BoxDecoration(
                  color: buttonTapped? Colors.teal.withOpacity(0.7): Colors.teal.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      offset: buttonTapped
                          ? const Offset(0, 0)
                          : const Offset(6.4, 6.4),
                      color: const Color.fromARGB(255, 0, 88, 78),
                      blurRadius: 1,
                    )
                  ],
                ),
                transform: buttonTapped
                    ? Matrix4.translationValues(5, 5, 0)
                    : Matrix4.translationValues(0, 0, 0),
                child: const Center(
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

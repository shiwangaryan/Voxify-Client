import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [Color(0xff454756), Color(0xff0f101b)],
          stops: [0.05, 0.3],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Image.asset(
            //   'assets/images/headset.png',
            //   height: width * 0.85,
            // ),
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
                  color: Colors.teal[200],
                  height: 60,
                ),
                const SizedBox(width: 15),
                const Text(
                  'VOXIFY',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 46,
                    color: Colors.white,
                    letterSpacing: -1.5,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
             Text(
              'start your podcast journey',
              style: TextStyle(
                fontWeight: FontWeight.w200,
                fontSize: 17,
                color: Colors.white.withOpacity(0.8),
                wordSpacing: 1.5,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

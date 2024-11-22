import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:voxify_client/utils/constants.dart';

class GlobalAppBar extends StatelessWidget {
  const GlobalAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    GetStorage storage = GetStorage();
    final profilePic = storage.read('profilePic') ?? 'dog1';
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 25,
      ),
      child: AppBar(
        backgroundColor: AppColors.bgColor,
        flexibleSpace: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/images/logo.svg',
              width: 30,
              color: Colors.teal[200],
            ),
            const SizedBox(width: 10),
            const Text(
              'VOXIFY',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w800,
                letterSpacing: -0.3,
              ),
            ),
            const Spacer(),
            GestureDetector(
              child: const Icon(
                Icons.search,
                weight: 0.08,
                color: Colors.white,
                size: 29,
              ),
            ),
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(5),
              height: 60,
              decoration: BoxDecoration(
                  shape: BoxShape.circle, color: Colors.blueGrey[500]),
              child: Center(
                child: Image.asset('assets/images/${profilePic}_shape.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:voxify_client/screens/create_page/create_podcast/create_podcast_screen.dart';
import 'package:voxify_client/services/bloc/navigation/navigation_bloc.dart';
import 'package:voxify_client/utils/constants.dart';

List<BottomNavigationBarItem> bottomNavbarItems = const [
  BottomNavigationBarItem(
    icon: Icon(Icons.home_filled),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.explore_rounded),
    label: 'Discover',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.mic_rounded),
    label: 'Create',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.person_rounded),
    label: 'Profile',
  ),
];

List<Widget> bottomNavbarScreens = [
  const Center(
    child: Text(
      'Home',
      style: TextStyle(color: Colors.white),
    ),
  ),
  const Center(
    child: Text(
      'Discover Screen',
      style: TextStyle(color: Colors.white),
    ),
  ),
  const CreatePodcastScreen(),
  const Center(
    child: Text(
      'Profile Screen',
      style: TextStyle(color: Colors.white),
    ),
  ),
];

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavigationBloc, NavigationState>(
      listener: (context, state) {},
      builder: (context, state) {
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 25,
                ),
                child: AppBar(
                  backgroundColor: AppColors.bgColor,
                  // // backgroundColor: Colors.white,
                  // leading: SvgPicture.asset('assets/images/logo.svg'),
                  // leadingWidth: 25,
                  // title: const Text(
                  //   'Voxify',
                  //   style: TextStyle(color: Colors.white),
                  // ),
                  flexibleSpace: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/logo.svg', width: 30),
                      const SizedBox(width: 10),
                      const Text(
                        'Voxify',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
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
                      const Icon(
                        Icons.person_outline_sharp,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            backgroundColor: AppColors.bgColor,
            body: bottomNavbarScreens[state.tabIndex],

            // ---- Bottom Navigation Bar ----

            bottomNavigationBar: SizedBox(
              height: 60,
              child: BottomNavigationBar(
                backgroundColor: AppColors.bottomNavbarColor,
                items: bottomNavbarItems,
                currentIndex: state.tabIndex,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(0.7),
                selectedFontSize: 11,
                unselectedFontSize: 11,
                iconSize: 26,
                selectedIconTheme: const IconThemeData(size: 26),
                onTap: (index) {
                  context
                      .read<NavigationBloc>()
                      .add(TabChangeEvent(tabIndex: index));
                },
                type: BottomNavigationBarType.fixed,
              ),
            ),
          ),
        );
      },
    );
  }
}

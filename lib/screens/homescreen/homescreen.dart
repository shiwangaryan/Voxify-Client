import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:voxify_client/screens/create_page/create_podcast/create_podcast_screen.dart';
import 'package:voxify_client/services/bloc/navigation/navigation_bloc.dart';
import 'package:voxify_client/utils/constants.dart';

List<BottomNavigationBarItem> _buildBottomNavbarItems(int selectedIndex) => [
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: Icon(
            selectedIndex== 0? Icons.home_filled : Symbols.home_filled_sharp,
            // selectedIndex == 0 ? Icons.home_filled : Icons.home_outlined,
          ),
        ),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: Icon(
            selectedIndex == 1 ? Icons.explore : Symbols.explore_sharp,
          ),
        ),
        label: 'Discover',
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 0.0),
          child: Icon(
            selectedIndex == 2 ? Icons.mic : Symbols.mic_sharp,
          ),
        ),
        label: 'Create',
      ),
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: Icon(
            selectedIndex == 3
                ? Icons.library_music
                : Symbols.library_music_sharp,
          ),
        ),
        label: 'Library',
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
                  flexibleSpace: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/images/logo.svg', width: 30),
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
                items: _buildBottomNavbarItems(state.tabIndex),
                currentIndex: state.tabIndex,
                selectedItemColor: Colors.white,
                unselectedItemColor: Colors.white.withOpacity(0.7),
                selectedFontSize: 12 ,
                unselectedFontSize: 12,
                selectedLabelStyle: TextStyle(letterSpacing: -0.2),
                iconSize: 27,
                selectedIconTheme: const IconThemeData(size: 27),
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

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';
import 'package:voxify_client/screens/create_page/create_podcast/create_podcast_screen.dart';
import 'package:voxify_client/services/bloc/navigation/navigation_bloc.dart';
import 'package:voxify_client/utils/constants.dart';
import 'package:voxify_client/utils/widgets/global_appbar.dart';

List<BottomNavigationBarItem> _buildBottomNavbarItems(int selectedIndex) => [
      BottomNavigationBarItem(
        icon: Padding(
          padding: const EdgeInsets.only(bottom: 1.0),
          child: Icon(
            selectedIndex == 0 ? Icons.home_filled : Symbols.home_filled_sharp,
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
            appBar: const PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: GlobalAppBar(),
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
                selectedFontSize: 12,
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


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voxify_client/screens/homescreen/homescreen.dart';
import 'package:voxify_client/screens/landing/landing_screen.dart';
import 'package:voxify_client/services/bloc/auth_popup/auth_popup_bloc.dart';
import 'package:voxify_client/services/bloc/navigation/navigation_bloc.dart';
import 'package:voxify_client/utils/constants.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    GetStorage storage = GetStorage();
    String userId = storage.read('userId') ?? "";

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        // statusBarColor: AppColors.bgColor,
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: AppColors.bottomNavbarColor,
      ),
    );
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => NavigationBloc()),
        if (userId.isEmpty) BlocProvider(create: (context) => AuthPopupBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
        home: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => NavigationBloc()),
            BlocProvider(create: (context) => AuthPopupBloc()),
          ],
          // child: const LandingPage(),
          child: userId.isNotEmpty ? const HomeScreen() : const LandingPage(),
        ),
      ),
    );
  }
}

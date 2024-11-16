import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voxify_client/screens/homescreen/homescreen.dart';
import 'package:voxify_client/services/bloc/navigation/navigation_bloc.dart';
import 'package:voxify_client/utils/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: AppColors.bgColor,
        systemNavigationBarColor: AppColors.bottomNavbarColor,
      ),
    );
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // textTheme: GoogleFonts.poppinsTextTheme(),
        textTheme: GoogleFonts.poppinsTextTheme(ThemeData.light().textTheme),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => NavigationBloc(),
        child: const HomeScreen(),
      ),
    );
  }
}

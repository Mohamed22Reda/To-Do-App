import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:to_do_app/core/utls/app_assets.dart';
import 'package:to_do_app/core/utls/app_colors.dart';
import 'package:to_do_app/core/utls/app_strings.dart';
import 'package:to_do_app/features/presentation/screens/on_bording_screen/on_bording_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    navigate();
  }
  void navigate()
  {
    Future.delayed(const Duration(seconds: 4),(){
      Navigator.push(context, MaterialPageRoute(builder: (_)=> OnBordingScreens()));
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo),
              const SizedBox(
                height: 24,
              ),
              Text(
                AppStrings.appName,
                style: GoogleFonts.lato(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 40,
                ),
              )
            ],
          ),
        ));
  }
}


import 'package:flutter/material.dart';
import 'package:to_do_app/core/utls/app_assets.dart';
import 'package:to_do_app/core/utls/app_colors.dart';
import 'package:to_do_app/core/utls/app_strings.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: AppStrings.appName,

      home: Scaffold(
        backgroundColor: AppColors.primary,
        body: Center(
          child: Image.asset(AppAssets.logo),
        ),
      ),
    );
  }
}
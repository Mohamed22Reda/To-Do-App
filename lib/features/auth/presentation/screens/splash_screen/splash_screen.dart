import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/database/cach/cach_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/core/utls/app_assets.dart';
import 'package:to_do_app/core/utls/app_strings.dart';
import 'package:to_do_app/features/auth/presentation/screens/on_bording_screen/on_bording_screens.dart';
import 'package:to_do_app/features/tasks/presentation/screens/homeScreen/home_screen.dart';

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
    //bool isVisited;
    bool isVisited = sl<CacheHelper>().getData(
        key: AppStrings.onBoardingKey,
    ) ??
        false;
    Future.delayed(const Duration(seconds: 3),(){
       Navigator.push(context,
          MaterialPageRoute(
            builder: (_)=> isVisited ?  const HomeScreen() : OnBordingScreens(),),);
    });
  }
  @override

  Widget build(BuildContext context) {
    return Scaffold(
        //backgroundColor: AppColors.background,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(AppAssets.logo),
               SizedBox(
                height: 24.h,
              ),
              Text(
                AppStrings.appName,
                style: Theme.of(context).textTheme.displayLarge!.copyWith(
                  fontSize: 40.sp,
                ),
              )
            ],
          ),
        ));
  }
}

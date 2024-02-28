import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/core/utls/app_strings.dart';
import 'package:to_do_app/features/auth/presentation/screens/splash_screen/splash_screen.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_state.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return BlocBuilder<TaskCubit, TaskState>(builder: (context, State) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: AppStrings.appName,
              theme: getAppTheme(),
              darkTheme:  getAppDarkTheme(),
              themeMode: BlocProvider.of<TaskCubit>(context).isDark
                  ? ThemeMode.dark
                  : ThemeMode.light,
              home: const SplashScreen());
        });
      },
    );
  }
}

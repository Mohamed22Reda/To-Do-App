import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/app/app.dart';
import 'package:to_do_app/core/bloc/bloc_observer.dart';
import 'package:to_do_app/core/database/cach/cach_helper.dart';
import 'package:to_do_app/core/database/sqflite_helper/sqflite_helper.dart';
import 'package:to_do_app/core/services/service_locator.dart';
import 'package:to_do_app/features/tasks/presentation/cubit/task_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await setup();
  await sl<CacheHelper>().init();
  sl<SqfliteHelper>().initDB();
  runApp(BlocProvider(
    create: (context) => TaskCubit()
      ..getTheme()
      ..getTasks(),
    child: const MyApp(),
  ));
}

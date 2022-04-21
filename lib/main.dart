import 'package:aorl_apps_bloc/counter/cubit/counter_cubit.dart';
import 'package:aorl_apps_bloc/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<CounterCubit>(
          create: (_) => CounterCubit(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          textTheme: kGoogleFontTextTheme,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: kElevatedButtonStyle,
          ),
        ),
        home: const MainPage(),
      ),
    );
  }
}

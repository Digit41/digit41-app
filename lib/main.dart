import 'package:digit41/utils/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit_logic/net_connection/net_connection_cubit.dart';
import 'presentation/screens/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NetConnectionCubit>(create: (_) => NetConnectionCubit()),
      ],
      child: MaterialApp(
        title: 'Digit41',
        theme: AppTheme.theme,
        home: const Splash(),
      ),
    );
  }
}

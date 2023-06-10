import 'package:doovu/app/bloc/app_bloc.dart';
import 'package:doovu/app/locator.dart';
import 'package:doovu/app/routes.dart';
import 'package:doovu/app/theme.dart';
import 'package:doovu/auth/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: locator.get<AuthBloc>()),
        BlocProvider(create: (_) => AppBloc())
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: routes,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: scaffoldBackGround,
          fontFamily: "Inter",
          colorSchemeSeed: const Color(0xff8875FF),
        ),
      ),
    );
  }
}

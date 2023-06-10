import 'package:doovu/app/bloc_observer.dart';
import 'package:doovu/app/hive_setup.dart';
import 'package:doovu/app/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app/app.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  setUp();
  await hiveInit();
  Bloc.observer = AppBlocObserver();
  runApp(const App());
}


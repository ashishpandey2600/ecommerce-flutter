import 'dart:developer';

import 'package:ecommerce_frontend/core/routes.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/ui.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => UserCubit())
        
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Themes.defaultTheme,
        onGenerateRoute: Routes.onGenrateRoute,
        initialRoute: LoginScreen.routeName,
      ),
    );
  }
}

class MyBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    log("created: $bloc");
    super.onCreate(bloc);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    log("Change in $bloc: $change");
    super.onChange(bloc, change);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    log("Error in $bloc: $error $stackTrace");
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    log("Change in $bloc: $transition");
    super.onTransition(bloc, transition);
  }

  @override
  void onClose(BlocBase bloc) {
    log("Closed : $bloc");
    super.onClose(bloc);
  }
}

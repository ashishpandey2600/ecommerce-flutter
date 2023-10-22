

import 'package:ecommerce_frontend/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/signup_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presentation/screens/auth/signup_screen.dart';

class Routes {
  static Route? onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(builder: (context) => ChangeNotifierProvider(create: (BuildContext context) => LoginProvider(context),
        child: const LoginScreen()));
      case SignupScreen.routeName:
        return CupertinoPageRoute(builder: (context) => 
        ChangeNotifierProvider(
          create: (context) => SignupProvider(context),
          child: const SignupScreen()));
      default:
        return null;//todo return 404 Screen
    }
  }
}





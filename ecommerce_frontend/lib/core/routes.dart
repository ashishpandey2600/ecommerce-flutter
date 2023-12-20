import 'package:ecommerce_frontend/data/models/product/product_model.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/login_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/signup_provider.dart';
import 'package:ecommerce_frontend/presentation/screens/home/home_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/splash/splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../presentation/screens/auth/signup_screen.dart';
import '../presentation/screens/product/product_details_screen.dart';

class Routes {
  static Route? onGenrateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LoginScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (BuildContext context) => LoginProvider(context),
                child: const LoginScreen()));

      case SignupScreen.routeName:
        return CupertinoPageRoute(
            builder: (context) => ChangeNotifierProvider(
                create: (BuildContext context) => SignUpProvider(context),
                child: const SignupScreen()));
      case HomeScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const HomeScreen());

      case SplashScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const SplashScreen());
      
      case ProductDetailsScreen.routeName:
        return CupertinoPageRoute(builder: (context) =>ProductDetailsScreen(
          productModel: settings.arguments as ProductModel,
        ));

      default:
        return null; //todo return 404 Screen
    }
  }
}

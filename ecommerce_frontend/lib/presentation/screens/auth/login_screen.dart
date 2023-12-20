import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/user_cubit/user_state.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/providers/login_provider.dart';
import 'package:ecommerce_frontend/presentation/screens/auth/signup_screen.dart';
import 'package:ecommerce_frontend/presentation/screens/home/home_screen.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:ecommerce_frontend/presentation/widgets/linkbutton.dart';
import 'package:ecommerce_frontend/presentation/widgets/primary_textfield.dart';
import 'package:ecommerce_frontend/presentation/widgets/primarybutton.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  static const String routeName = "login";

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<LoginProvider>(context);

    return BlocListener<UserCubit, UserState>(
      listener: (context, state) {
        if (state is UserLoggedInState) {
          Navigator.popUntil(context, (route) => route.isFirst);
          Navigator.pushReplacementNamed(context, HomeScreen.routeName);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Ecommerce App"),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Form(
            key: provider.formKey,
            child: ListView(
              children: [
                const GapWidget(),
                Text(
                  "LogIn",
                  style: TextStyles.heading2,
                ),
                const GapWidget(),
                (provider.error != "")
                    ? Text(
                        provider.error,
                        style: TextStyle(color: Colors.red),
                      )
                    : SizedBox(),
                const GapWidget(),
                PrimaryTextField(
                  labelText: "Email",
                  controller: provider.emailController,
                  prefixIcon: Icon(Icons.email),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Email address is required!";
                    }

                    if (!EmailValidator.validate(value.trim())) {
                      return "Invalid Email Address";
                    }
                    return null;
                  },
                ),
                const GapWidget(),
                PrimaryTextField(
                  labelText: "Password",
                  controller: provider.passwordController,
                  obscureText: true,
                  prefixIcon: Icon(Icons.password),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return "Password is required!";
                    }
                    return null;
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    LinkButton(
                      text: "Forgot Password?",
                      onpressed: () {},
                    ),
                  ],
                ),
                const GapWidget(),
                PrimaryButton(
                  text: (provider.isLoading) ? "..." : "LogIn",
                  onpressed: provider.logIn,
                ),
                const GapWidget(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(fontSize: 18),
                    ),
                    LinkButton(
                      text: "SignUp",
                      onpressed: () {
                        Navigator.pushNamed(context, SignupScreen.routeName);
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        )),
      ),
    );
  }
}

import 'package:ecommerce_frontend/presentation/screens/auth/providers/signup_provider.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/ui.dart';
import '../../widgets/gap_widget.dart';
import '../../widgets/linkbutton.dart';
import '../../widgets/primary_textfield.dart';
import '../../widgets/primarybutton.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  static const String routeName = "signup";

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SignupProvider>(context);
    return Scaffold(
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
                      style: const TextStyle(color: Colors.red),
                    )
                  : const SizedBox(),
              const GapWidget(),
              PrimaryTextField(
                labelText: "Email",
                controller: provider.emailController,
                prefixIcon: const Icon(Icons.email),
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
              const GapWidget(),
              PrimaryTextField(
                labelText: "Confirm Password",
                controller: provider.passwordController,
                obscureText: true,
                prefixIcon: const Icon(Icons.password),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      provider.passwordController.text.trim() != value.trim()) {
                    return "Password doesnot match!";
                  }
                  return null;
                },
              ),
              const GapWidget(),
              PrimaryButton(
                text: (provider.isLoading) ? "..." : "Sign Up",
                onpressed: provider.createAccount,
              ),
              const GapWidget(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Text(
                    "Don't have an account?",
                    style: TextStyles.body2,
                  ),
                  LinkButton(
                    text: "Sign up ",
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
    );
  }
}

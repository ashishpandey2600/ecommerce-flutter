import 'package:ecommerce_frontend/core/ui.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? onpressed;

  const PrimaryButton({super.key, required this.text,this.onpressed });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: CupertinoButton(
        onPressed:onpressed,
        color: AppColors.accent,
          child: Text(text),
      ),
    );
  }
}

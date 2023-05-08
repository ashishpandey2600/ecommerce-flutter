import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../core/ui.dart';

class LinkButton extends StatelessWidget {
  final String text;
  final Function()? onpressed;

  const LinkButton({super.key, required this.text, this.onpressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onpressed,
      child: Text(
        text,
      ),
    );
  }
}

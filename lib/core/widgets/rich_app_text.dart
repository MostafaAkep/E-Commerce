import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class RichAppText extends StatelessWidget {
  const RichAppText(
    this.normText,
    this.tapText, {
    super.key,
    required this.onTapFun,
  });
  final void Function()? onTapFun;
  final String normText;
  final String tapText;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: normText,
            style: const TextStyle(color: Colors.grey, fontSize: 11),
          ),
          TextSpan(
            text: tapText,
            style: const TextStyle(
              color: Color(0xffC8FE3B),
              fontSize: 11,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTapFun,
          ),
        ],
      ),
    );
  }
}

import 'package:e_commerce_app/core/theme/app_colors.dart';
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
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: normText,
            style: const TextStyle(
              color: AppColors.grey,
              fontSize: 11,
            ),
          ),
          TextSpan(
            text: tapText,
            style: const TextStyle(
              color: AppColors.black,
              fontSize: 11,
            ),
            recognizer: TapGestureRecognizer()..onTap = onTapFun,
          ),
        ],
      ),
    );
  }
}

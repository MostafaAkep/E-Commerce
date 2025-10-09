import 'package:flutter/material.dart';

class PublicContainer extends StatelessWidget {
  const PublicContainer({
    super.key,
    required this.containerColor,
    required this.title,
    required this.titleColor,
    required this.onTap,
  });
  final Color containerColor;
  final Color titleColor;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(4),
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: 40,
        width: 500,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: containerColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: titleColor,
          ),
        ),
      ),
    );
  }
}

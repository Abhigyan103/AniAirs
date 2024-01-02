import 'package:animu_cal/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CardMiniBox extends ConsumerWidget {
  final String text;
  final Color backgroundColor, textColor;
  final double fontSize;
  final int? index;
  CardMiniBox(
      {super.key,
      required this.text,
      Color? backgroundColor,
      Color? textColor,
      double? fontSize,
      this.index = 0})
      : backgroundColor =
            backgroundColor ?? boxColors[index! % boxColors.length],
        textColor = textColor ?? MyColors.black,
        fontSize = fontSize ?? 10;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      height: 25,
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
          boxShadow: [
            BoxShadow(
                offset: const Offset(1, 1),
                blurRadius: 3,
                color: MyColors.shadowBlack)
          ]),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Center(
          child: Text(
            text.toUpperCase(),
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  fontSize: fontSize,
                  color: textColor,
                ),
          ),
        ),
      ),
    );
  }
}

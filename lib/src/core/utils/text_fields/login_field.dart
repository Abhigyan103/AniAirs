import 'package:AniAirs/theme.dart';
import 'package:flutter/material.dart';




class LoginField extends StatefulWidget {
  final String hintText;
  final IconData? prefixIcon;
  final bool showPasswordSuffix;

  const LoginField({
    Key? key,
    required this.hintText,
    this.prefixIcon,
    this.showPasswordSuffix = false,
  }) : super(key: key);

  @override
  _LoginFieldState createState() => _LoginFieldState();
}

class _LoginFieldState extends State<LoginField> {
  bool obscureText = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 69,
      width: double.infinity,
      decoration: BoxDecoration(
          color: MyColors.lightShadowBlack,
          borderRadius: BorderRadius.circular(12)),
      child: TextFormField(
        style: const TextStyle(
          fontFamily: 'League Spartan',
          color: Colors.white,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(27),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.grey, // Replace with your desired color
              width: 0.5, // Replace with your desired width
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          prefixIcon: widget.prefixIcon != null
              ? Icon(
            widget.prefixIcon,
            size: 24,
            color: MyColors.lightMarineBlue,
          )
              : null,
          suffixIcon: widget.showPasswordSuffix
              ? InkWell(
            onTap: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              size: 20, // Replace with your desired size
              color: MyColors
                  .lightMarineBlue, // Replace with your desired color
            ),
          )
              : null,
        ),
      ),
    );
  }
}
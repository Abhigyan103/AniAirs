import 'package:flutter/material.dart';

class MyColors {
  static Color saffron = const Color(0xFFE9C46A);
  static Color persianGreen = const Color(0xFF2A9D8F);
  static Color charcoal = const Color(0xFF264653);
  static Color sandyBrown = const Color(0xFFF4A261);
  static Color black = const Color(0xFF000000);
  static Color shadowBlack = const Color(0x77000000);
  static Color shadowPersianGreen = const Color(0x77B7FFF6);
  static Color lightPersianGreen = const Color(0xFF58FCEC);
}

final List<Color> boxColors = [
  const Color(0xFFFF99C9),
  const Color(0xFF58FCEC),
  const Color(0xFFC1BDDB),
  const Color(0xFFA2C7E5),
];
final List<Color?> navColors = [
  const Color.fromARGB(255, 144, 78, 25),
  const Color.fromARGB(255, 148, 15, 15),
  const Color.fromARGB(255, 130, 110, 59),
  const Color.fromARGB(255, 10, 108, 97),
  null,
  null
];
const String _primaryFont = 'League Spartan';

ThemeData darkTheme = ThemeData.dark(
  useMaterial3: true,
).copyWith(
  scaffoldBackgroundColor: const Color(0xFF1E1E1E),
  textTheme: const TextTheme().copyWith(
    displayMedium: const TextStyle(
        fontSize: 26,
        fontFamily: _primaryFont,
        // fontWeight: FontWeight.w800,
        color: Colors.white),
    bodyLarge: TextStyle(
        fontSize: 16,
        fontFamily: _primaryFont,
        // fontWeight: FontWeight.w800,
        color: MyColors.black),
    bodyMedium: TextStyle(
      fontSize: 13,
      fontFamily: _primaryFont,
      fontWeight: FontWeight.w900,
      color: MyColors.black,
    ),
    bodySmall: TextStyle(
        fontSize: 11,
        fontFamily: _primaryFont,
        fontWeight: FontWeight.w100,
        color: MyColors.black,
        height: 0.9),
  ),
  navigationDrawerTheme: const NavigationDrawerThemeData().copyWith(
    labelTextStyle: const MaterialStatePropertyAll(TextStyle(
        fontFamily: 'League Spartan',
        fontSize: 16.5,
        color: Color.fromARGB(255, 227, 227, 227),
        fontWeight: FontWeight.normal)),
    indicatorShape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: const ButtonStyle().copyWith(
          textStyle: MaterialStatePropertyAll(const TextStyle().copyWith(
              fontFamily: _primaryFont,
              fontWeight: FontWeight.w500,
              fontSize: 16)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.focused) ||
                states.contains(MaterialState.selected) ||
                states.contains(MaterialState.hovered)) {
              return const Color.fromARGB(255, 96, 96, 96);
            }
            return Color.fromARGB(255, 29, 29, 29);
          }),
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.selected) ||
                states.contains(MaterialState.focused)) {
              return 0;
            }
            return 5;
          }))),
  filledButtonTheme: FilledButtonThemeData(
      style: const ButtonStyle().copyWith(
          textStyle: MaterialStatePropertyAll(const TextStyle().copyWith(
              fontFamily: _primaryFont,
              fontWeight: FontWeight.w500,
              fontSize: 20)),
          shape: MaterialStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.focused) ||
                states.contains(MaterialState.selected) ||
                states.contains(MaterialState.hovered)) {
              return MyColors.shadowPersianGreen;
            }
            return MyColors.persianGreen;
          }),
          elevation: MaterialStateProperty.resolveWith((states) {
            if (states.contains(MaterialState.pressed) ||
                states.contains(MaterialState.selected) ||
                states.contains(MaterialState.focused)) {
              return 0;
            }
            return 5;
          }))),
);

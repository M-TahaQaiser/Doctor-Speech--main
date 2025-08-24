import 'package:flutter/material.dart';
import 'package:TinyDragonTherapy/themes/colors.dart';

class ThemeStyle {
  static ThemeData lightTheme = ThemeData(
    // datePickerTheme: DatePickerThemeData(
    //   backgroundColor: Colors.white,
    //   todayBackgroundColor: WidgetStateColor.resolveWith(
    //     (states) => kPrimaryColor,
    //   ),

    // selectedBackgroundColor: Colors.amber,
    // dayTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    // monthTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold, color: Colors.black),
    // yearTextStyle: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold, color: Colors.black),
    // ),
    appBarTheme: AppBarTheme(
      backgroundColor: kScaffoldBackgroundColor,
      iconTheme: IconThemeData(color: kPrimarySwatchColor),
      foregroundColor: kPrimarySwatchColor,
      surfaceTintColor: kLightColor,
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kSecondarySwatchColor),
        foregroundColor: WidgetStateProperty.all(kLightColor),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        padding: WidgetStateProperty.all(
          const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
      ),
    ),
    actionIconTheme: ActionIconThemeData(
      endDrawerButtonIconBuilder: (context) {
        return Icon(Icons.menu, color: kDarkColor);
      },
    ),
    iconButtonTheme: IconButtonThemeData(
      style: ButtonStyle(
          foregroundColor: WidgetStateProperty.all(kPrimarySwatchColor)),
    ),
    menuButtonTheme: MenuButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kLightColor),
        side: WidgetStateProperty.all<BorderSide>(
          BorderSide(color: kPrimarySwatchColor),
        ),
      ),
    ),
    segmentedButtonTheme: SegmentedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStateProperty.all(kPrimarySwatchColor),
      ),
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: kLightColor,
      // todayBackgroundColor: WidgetStatePropertyAll(kPrimarySwatchColor),
      confirmButtonStyle: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith(
          (states) => const TextStyle(color: Colors.white),
        ),
        backgroundColor: WidgetStateProperty.all(Colors.white),
      ),
      cancelButtonStyle: ButtonStyle(
        textStyle: WidgetStateProperty.resolveWith(
          (states) => const TextStyle(color: Colors.white),
        ),
        backgroundColor: WidgetStateProperty.all(kPrimaryColor.withOpacity(.3)),
      ),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateColor.resolveWith(
        (Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return kPrimarySwatchColor;
          }
          return kDividerColor;
        },
      ),
    ),
    checkboxTheme: CheckboxThemeData(
      side: WidgetStateBorderSide.resolveWith(
        (Set<WidgetState> states) {
          return const BorderSide(color: Colors.grey);
        },
      ),
    ),
    scaffoldBackgroundColor: kScaffoldBackgroundColor,
    primarySwatch: kPrimarySwatchColor,
    dialogBackgroundColor: kLightColor,
    bottomSheetTheme: BottomSheetThemeData(backgroundColor: kLightColor),
    textTheme: TextTheme(
      displayLarge: TextStyle(fontFamily: 'Epilogue-Black', color: kLightColor),
      displayMedium:
          TextStyle(fontFamily: 'Epilogue-Black', color: kLightColor),
      displaySmall: TextStyle(fontFamily: 'Epilogue-Black', color: kLightColor),
      headlineLarge:
          TextStyle(fontFamily: 'Epilogue-Black', color: kLightColor),
      headlineMedium:
          TextStyle(fontFamily: 'Epilogue-Black', color: kLightColor),
      headlineSmall:
          TextStyle(fontFamily: 'Epilogue-Black', color: kLightColor),
      titleLarge: TextStyle(
          fontFamily: 'Epilogue-Bold',
          color: kLightColor,
          fontSize: 24,
          fontWeight: FontWeight.bold),
      titleMedium: TextStyle(
          fontFamily: 'Epilogue-Bold',
          color: kLightColor,
          fontSize: 22,
          fontWeight: FontWeight.bold),
      titleSmall: TextStyle(
          fontFamily: 'Epilogue-Black', color: kLightColor, fontSize: 20),
      bodyLarge: TextStyle(
          fontFamily: 'Epilogue-Black', color: kLightColor, fontSize: 18),
      bodyMedium: TextStyle(
          fontFamily: 'Epilogue-Black', color: kLightColor, fontSize: 16),
      bodySmall: TextStyle(
          fontFamily: 'Epilogue-Black', color: kLightColor, fontSize: 14),
      labelLarge: TextStyle(fontFamily: 'Epilogue-Black', color: kLightColor),
      labelMedium: TextStyle(fontFamily: 'Epilogue-Black', color: kLightColor),
      labelSmall: TextStyle(fontFamily: 'Epilogue-Black', color: kLightColor),
    ),
  );
}

import 'package:flutter/material.dart';

ThemeData getLightTheme() {
  var light_theme = ThemeData.light();
  return ThemeData.light().copyWith(
      cardColor: Colors.white,
      scaffoldBackgroundColor: LightThemeColors.backgroungcolor,
      primaryColor: LightThemeColors.blueDark,
      textTheme: light_theme.textTheme
          .copyWith(labelSmall: TextStyle(color: Colors.grey[500])),
      inputDecorationTheme:
          const InputDecorationTheme(border: OutlineInputBorder()),
      elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith<Color>((states) {
                if (states.contains(MaterialState.disabled)) {
                  return Colors.grey;
                }
                return Colors.red;
              }),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.transparent))))),
      colorScheme: ThemeData.light().colorScheme.copyWith(
            onSecondary: Colors.white,
            onPrimary: Colors.black,
            primary: LightThemeColors.red,
            secondary: LightThemeColors.red,
          ),
      secondaryHeaderColor: LightThemeColors.blueDark,
      //secondaryHeaderColor: Colors.red,
      segmentedButtonTheme: SegmentedButtonThemeData(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.resolveWith<Color>(
                (Set<MaterialState> states) {
                  if (states.contains(MaterialState.selected)) {
                    return const Color.fromARGB(255, 215, 214, 214);
                  }
                  return Colors.transparent;
                },
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                      side: const BorderSide(color: Colors.transparent))))),
      //app bar theme
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(),
      ),
      //list tile
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        iconColor: LightThemeColors.greenLightColor,
        tileColor: LightThemeColors.whiteColor,
      ),
      //tab bar theme
      tabBarTheme: const TabBarTheme(
        //tabAlignment: TabAlignment.start,
        labelColor: Colors.blue,
        indicatorColor: Colors.blue,
        unselectedLabelColor: Colors.black,
        dividerColor: Colors.transparent,
      ),
      switchTheme: SwitchThemeData(
        trackColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.green;
            }
            return Colors.grey;
          },
        ),
        thumbColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.selected)) {
              return Colors.white;
            }
            return Colors.white;
          },
        ),
        overlayColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            return Colors.green;
          },
        ),
      ),
      drawerTheme: DrawerThemeData(
        backgroundColor: Colors.grey[200],
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      iconTheme: const IconThemeData(color: Colors.black));
}

class LightThemeColors {
  static Color get whiteColor => const Color.fromARGB(0, 255, 255, 255);
  // static Color get greenLightColor => Color.fromARGB(160, 0, 0, 0);
  static Color get greenLightColor => const Color.fromRGBO(44, 136, 161, 1);
  static Color get blueDark => const Color.fromRGBO(12, 18, 30, 1);
  static Color get blueLight => const Color.fromRGBO(141, 232, 253, 1);
  static Color get backgroungcolor => Colors.white;
  // static Color get backgroungcolor => const Color.fromARGB(255, 245, 245, 245);
  // static Color get backgroungcolor => const Color.fromRGBO(244, 243, 248, 1);
  static Color get red => Colors.red;
}

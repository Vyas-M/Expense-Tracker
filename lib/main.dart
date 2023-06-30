import 'package:flutter/material.dart';

import 'widgets/expenses.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      // darkTheme: ThemeData.dark().copyWith(
      //   brightness: Brightness.dark,
      //   useMaterial3: true,
      //   colorScheme: kDarkColorScheme,
      //   cardTheme: CardTheme().copyWith(
      //     color: kDarkColorScheme.onSecondaryContainer,
      //     margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      //   ),
      //   appBarTheme: AppBarTheme().copyWith(
      //     backgroundColor: kDarkColorScheme.onPrimaryContainer,
      //     foregroundColor: kDarkColorScheme.primaryContainer,
      //   ),
      // ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: CardTheme().copyWith(
          //color: kColorScheme.onSecondaryContainer,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.onPrimaryContainer,
            padding: EdgeInsets.all(3),
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: ThemeData().textTheme.titleLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: kColorScheme.onSecondaryContainer,
                    fontSize: 16,
                  ),
            ),
      ),
      debugShowCheckedModeBanner: false,
      //themeMode: ThemeMode.system,
      home: Expenses(),
    ),
  );
}

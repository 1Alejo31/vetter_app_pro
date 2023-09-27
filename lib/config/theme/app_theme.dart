import 'package:flutter/material.dart';

const colorList = <Color>[
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent
];

class AppTheme {
  final int selectColor;
  final bool isDarkmode;
  AppTheme({this.isDarkmode = false, this.selectColor = 0})
      : assert(selectColor >= 0, 'Selected color must be greater then 0'),
        assert(selectColor < colorList.length,
            'Selected color must be lees or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: isDarkmode ? Brightness.dark : Brightness.light,
        colorSchemeSeed: colorList[selectColor],
        appBarTheme: const AppBarTheme(centerTitle: false),
      );

  //Creando metodo q regresa una instancia de AppTheme
  AppTheme copyWhith({
    int? selectedColor,
    bool? isDarkmode,
  }) =>
      AppTheme(
          selectColor: selectedColor ?? selectColor,
          isDarkmode: isDarkmode ?? this.isDarkmode);
}

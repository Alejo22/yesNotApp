import 'package:flutter/material.dart';

const Color customColor = Color(0xFFDD4411); 

const List<Color> _colorThemes = [
  customColor,
  Colors.orange,
  Colors.pink,
  Colors.yellow,
  Colors.black,
  Colors.blue,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.brown,
  Colors.amber,
];
  
class AppTheme {

  final int selectedColor;

  AppTheme({ 
    this.selectedColor = 0
  }):assert(selectedColor >= 0, 'Selected color can´t no by less than 0'),
    assert( selectedColor < _colorThemes.length, 'Selected color can´t no by more than ${_colorThemes.length}'  );
  

  ThemeData theme(){
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: _colorThemes[selectedColor]
    );
  }
  

}
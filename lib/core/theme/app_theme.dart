import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppTheme {

  static ThemeData lightTheme(){

    //transparent status bar
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.blue
    );
  }
}
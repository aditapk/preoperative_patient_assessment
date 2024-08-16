import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFE0E9E5),
  100: Color(0xFFB3C9BD),
  200: Color(0xFF80A591),
  300: Color(0xFF4D8165),
  400: Color(0xFF266644),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF00441F),
  700: Color(0xFF003B1A),
  800: Color(0xFF003315),
  900: Color(0xFF00230C),
});
const int _primaryPrimaryValue = 0xFF004B23;

const MaterialColor primaryAccent =
    MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFF5FFF7C),
  200: Color(_primaryAccentValue),
  400: Color(0xFF00F82D),
  700: Color(0xFF00DF28),
});
const int _primaryAccentValue = 0xFF2CFF52;

import 'package:flutter/widgets.dart';

class ColorManager{
  static Color primary = HexColor.fromHex("000000");
  static Color secondary = HexColor.fromHex("04009A");
  static Color secondaryButton = HexColor.fromHex("C62A88");
  static Color lightGrey = HexColor.fromHex("6ce6cc");
  static Color midGrey = HexColor.fromHex("7897AB");
  static Color darkGrey = HexColor.fromHex("6ce6cc");
  static Color errorColor = HexColor.fromHex("F05454");
  static Color cardColor = HexColor.fromHex("F7F7F7");
  static Color greenColor = HexColor.fromHex("4E9F3D");
  static Color darkColor = HexColor.fromHex("000000");
  static Color frostedGlass = HexColor.fromHex("eaf0f0");
  static Color offGrey = HexColor.fromHex("#E7EAEF");
}

extension HexColor on Color{
  static Color fromHex(String hexColorString){
    hexColorString = hexColorString.replaceAll('#', '');
    if(hexColorString.length == 6){
      hexColorString = "FF" + hexColorString;
    }

    return Color(int.parse(hexColorString,radix:16));
  }
}
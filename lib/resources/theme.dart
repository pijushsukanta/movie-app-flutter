
import 'package:flutter/material.dart';
import 'package:movie_app/resources/style.dart';
import 'package:movie_app/resources/values.dart';

import 'colors.dart';
import 'fonts.dart';

ThemeData getApplicationTheme(){
  return ThemeData(
    // main color of app
    primaryColor:  ColorManager.primary,
    primaryColorLight: ColorManager.primary,
    disabledColor: ColorManager.lightGrey,
    // Ripple Color
      splashColor: ColorManager.secondary,
    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.cardColor,
      shadowColor: ColorManager.secondary,
      elevation: AppSize.s12,
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      centerTitle: true,
      color: ColorManager.primary,
      elevation: AppSize.s4,
      shadowColor: ColorManager.primary,
      titleTextStyle: getMediumStyle(color: ColorManager.darkColor,fontSize: FontSize.s20),
    ),
    // Button theme
    buttonTheme: ButtonThemeData(
      shape: const StadiumBorder(),
      disabledColor: ColorManager.midGrey,
      buttonColor: ColorManager.darkGrey,
      splashColor: ColorManager.lightGrey
    ),

    // Elevated Button
    elevatedButtonTheme: ElevatedButtonThemeData(

      style: ElevatedButton.styleFrom(
        textStyle: getRegularStyle(color: Colors.white),
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSize.s4)),
      )
    ),
    //Text Theme
    textTheme: TextTheme(
      headline1: getBoldStyle(color: ColorManager.primary,fontSize: FontSize.s16),
      subtitle1: getMediumStyle(color: ColorManager.primary,fontSize: FontSize.s14),
      caption: getRegularStyle(color: ColorManager.secondary),
      bodyText1: getRegularStyle(color: ColorManager.secondary),
      button: getMediumStyle(color: Colors.white)
    ),
    // Input Decoration Theme
    inputDecorationTheme: InputDecorationTheme(
      iconColor: ColorManager.primary,
      contentPadding: const EdgeInsets.all(AppPadding.p8),
      //hint style
      hintStyle: getRegularStyle(color: Colors.black87),
      labelStyle: getMediumStyle(color: ColorManager.primary),
      errorStyle: getRegularStyle(color: ColorManager.errorColor),
      // enabled Border
      enabledBorder:  const OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.black,width: AppSize.s1),
        borderRadius: BorderRadius.all(Radius.circular(AppSize.s4)),
      ),
      // Focus Border
      focusedBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.secondary,width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s4)),
      ),
      //Error Color
      errorBorder:  OutlineInputBorder(
        borderSide: BorderSide(color: ColorManager.errorColor,width: AppSize.s1),
        borderRadius: const BorderRadius.all(Radius.circular(AppSize.s8)),
      ),

    ),



    //Box Decoration

  );
}

BoxDecoration getBoxDecoration(){
  return BoxDecoration(
    // color: ColorManager.offGrey,
      borderRadius: BorderRadius.circular(AppSize.s4),
      border: Border.all(color: ColorManager.primary,width: AppSize.s1_5)
  );
}
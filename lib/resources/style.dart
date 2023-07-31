
import 'package:flutter/material.dart';
import 'package:movie_app/resources/colors.dart';

import 'fonts.dart';


TextStyle _getTextStyle(double fontSize,String fontFamily,FontWeight fontWeight,Color color){
  return TextStyle(
    fontSize: fontSize,
    fontFamily: fontFamily,
    color: color,
    fontWeight: fontWeight
  );
}

TextStyle getRegularStyle({double fontSize = FontSize.s14, required Color color}){
  return _getTextStyle(fontSize, FontManager.fontFamily,FontWeightManager.regular, color);
}

//light text style
TextStyle getLightStyle({double fontSize = FontSize.s14, required Color color}){
  return _getTextStyle(fontSize, FontManager.fontFamily,FontWeightManager.light, color);
}

// Medium Text Style
TextStyle getMediumStyle({double fontSize = FontSize.s14, required Color color}){
  return _getTextStyle(fontSize, FontManager.fontFamily,FontWeightManager.medium, color);
}

// Bold Text Style
TextStyle getBoldStyle({double fontSize = FontSize.s14, required Color color}){
  return _getTextStyle(fontSize, FontManager.fontFamily,FontWeightManager.bold, color);
}

Widget getVerticalSpace() => const SizedBox(
  height: 10.0,
);

textStyle() => getBoldStyle(color: ColorManager.primary,fontSize: 12);

Icon iconStyle(icon) => Icon(icon,color: Colors.white);

dashboardCard(width,height,title,value) => ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: height,
                                minWidth: width,
                                maxWidth: width
                            ),
                            child: Center(
                                child: Column(
                                  children: [
                                    Text(title,style: textStyle()),
                                    getVerticalSpace(),
                                    Text("${value ?? 0}",style: getBoldStyle(color: ColorManager.secondary,fontSize: 16))
                                  ],
                                )
                            )
                        );

dashboardSubCard(width,height,title,value) => ConstrainedBox(
                            constraints: BoxConstraints(
                                minHeight: height,
                                minWidth: width/3,
                                maxWidth: width/2
                            ),
                            child: Center(
                                child: Column(
                                  children: [
                                    Text(title,style: textStyle()),
                                    getVerticalSpace(),
                                    Text("${value ?? 0}",style: getBoldStyle(color: ColorManager.secondary,fontSize: 14))
                                  ],
                                )
                            )
                        );
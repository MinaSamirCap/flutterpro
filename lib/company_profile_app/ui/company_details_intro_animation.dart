import 'package:flutter/material.dart';

class CompanyDetailsIntroAnimation {


  CompanyDetailsIntroAnimation(this.controller)
      : bgdropOpacity = Tween(begin: 0.5, end: 1.0).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.000, 0.500, curve: Curves.ease))),
        bgdropBlur = Tween(begin: 0.0, end: 0.5).animate(CurvedAnimation(
            parent: controller,
            curve: Interval(0.000, 0.800, curve: Curves.ease)));

  final AnimationController controller;
  final Animation<double> bgdropOpacity;
  final Animation<double> bgdropBlur;
//  final Animation<double> avatarSize;
//  final Animation<double> nameOpacity;
//  final Animation<double> locationOpacity;
//  final Animation<double> dividerWidth;
//  final Animation<double> aboutOpacity;
//  final Animation<double> courseScrollerXTranslation;
//  final Animation<double> courseScrollerOpacity;

}

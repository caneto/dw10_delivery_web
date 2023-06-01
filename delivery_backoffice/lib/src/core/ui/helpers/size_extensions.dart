import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get screenWidth => MediaQuery.sizeOf(this).width;
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenShortestSide => MediaQuery.sizeOf(this).shortestSide;
  double get screenLongestSide => MediaQuery.sizeOf(this).longestSide;


  double percentWidth(double percent) => screenWidth * percent;
  double percentHeight(double percent) => screenHeight * percent;
}
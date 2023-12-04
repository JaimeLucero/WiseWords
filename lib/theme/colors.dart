import 'dart:ui';
import 'package:flutter/material.dart';

class AppColors {
  int _currentIndex = 0;

  Color getNextColor() {
    // List of predefined colors
    List<Color> colors = [
      Color(0xFFE50058).withOpacity(0.7),
      Color(0xFFFF7408).withOpacity(0.7),
      Color(0xFFFFBE36).withOpacity(0.7),
    ];

    // Get the color at the current index
    Color nextColor = colors[_currentIndex];

    // Increment the index and reset to 0 if it exceeds the list length
    _currentIndex = (_currentIndex + 1) % colors.length;

    return nextColor;
  }
}
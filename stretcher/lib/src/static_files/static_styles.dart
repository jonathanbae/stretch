import 'package:flutter/material.dart';

class StretcherStyles {
  ///big font style
  static final TextStyle _biggerFont = const TextStyle(fontSize: 24.0);
  static final TextStyle _timerFont = const TextStyle(fontSize: 80.0);
  static final TextStyle _workoutFont = const TextStyle(fontSize: 40.0);
  /***********************
   ****** Getters ********
   ***********************/
  ///big Font Style
  TextStyle get biggerFont => _biggerFont;
  TextStyle get timerFont => _timerFont;
  TextStyle get workoutFont => _workoutFont;
}
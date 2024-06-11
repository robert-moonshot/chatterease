import 'package:chatter_ease/theme_data.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class ThemeController extends GetxController {
  ThemeData theme = MyAppThemes.lightTheme;

  setThemeData(ThemeData data) {
    theme = data;
    update();
  }
}

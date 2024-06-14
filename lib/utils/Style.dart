import 'dart:ui';
import 'package:assignment/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

double width = MediaQuery.of(Get.context!).size.width;
double height = MediaQuery.of(Get.context!).size.height;


final title=TextStyle(
    fontSize: width*0.055,
    fontWeight: FontWeight.w600,
    color: AppConstasnts.theme_color,
);
final button_style=TextStyle(
    fontSize: width*0.04,
    fontWeight: FontWeight.bold,
    color: Colors.grey.shade600
);

final normal_style=TextStyle(
  fontSize: width*0.045,
  color: Colors.black,
  fontWeight: FontWeight.bold
);

final drawerstyle=const TextStyle(

);
final appbar_title=const TextStyle(
color: Colors.black
);
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

extension StringNumberExtension on String {
  String formatPrice() {
    final formattedNarx = replaceAllMapped(
        RegExp(r'\d{1,3}(?=(\d{3})+(?!\d))'), (match) => '${match[0]},');
    return formattedNarx;
  }
}

extension SizedBoxExtensions on int{
  Widget get height => SizedBox(height: h);
  Widget get width => SizedBox(width: w);
}
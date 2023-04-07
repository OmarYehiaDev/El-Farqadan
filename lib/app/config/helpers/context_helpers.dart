import 'package:flutter/material.dart';

extension MediaQueryHelpers on BuildContext {
  double get height => MediaQuery.of(this).size.height;
  double get width => MediaQuery.of(this).size.width;
  double get bottom => MediaQuery.of(this).viewInsets.bottom;
  double get topPadding => MediaQuery.of(this).viewPadding.top;
}

extension LocaleHelpers on BuildContext {
  TextDirection get textDirection => Directionality.of(this);
  // Locale get locale => this.locale;
}

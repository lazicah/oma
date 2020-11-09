import 'package:flutter/material.dart';

class Insets {
  static double gutterScale = 1;

  static double scale = 1;

  /// Dynamic insets, may get scaled with the device size
  static double get mGutter => m * gutterScale;

  static double get lGutter => l * gutterScale;

  static double get xs => 2 * scale;

  static double get sm => 6 * scale;

  static double get m => 12 * scale;

  static double get l => 24 * scale;

  static double get xl => 36 * scale;
}

class Space extends StatelessWidget {
  final double width;
  final double height;

  Space(this.width, this.height);

  @override
  Widget build(BuildContext context) => SizedBox(width: width, height: height);
}

class VSpace extends StatelessWidget {
  final double size;

  const VSpace(this.size, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(0, size);
}

class HSpace extends StatelessWidget {
  final double size;

  const HSpace(this.size, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Space(size, 0);
}

class Corners {
  static double get btn => s5;

  static double get dialog => 12;

  /// Xs
  static double get s3 => 3;

  static BorderRadius get s3Border => BorderRadius.all(s3Radius);

  static Radius get s3Radius => Radius.circular(s3);

  /// Small
  static double get s5 => 5;

  static BorderRadius get s5Border => BorderRadius.all(s5Radius);

  static Radius get s5Radius => Radius.circular(s5);

  /// Medium
  static double get s8 => 8;

  static BorderRadius get s8Border => BorderRadius.all(s8Radius);

  static Radius get s8Radius => Radius.circular(s8);

  /// Large
  static double get s10 => 10;

  static BorderRadius get s10Border => BorderRadius.all(s10Radius);

  static Radius get s10Radius => Radius.circular(s10);
}

class AppColors {
  static Color get colorA => Color(0xff326574);

  static Color get colorB => Color(0xffFB9B01);

  static Color get piggy => Color(0xff093d96);

  static Color get dstv => Color(0xff006EB0);

  static Color get bgA => Color(0xffFFFFFF);

  static Color get bgB => Color(0xffF7F8FA);

  static Color get bgC => Color(0xffFCFCFC);
}

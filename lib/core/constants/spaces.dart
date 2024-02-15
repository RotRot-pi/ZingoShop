import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//size
const double zero = 0;
const double s4 = 4;
const double s8 = 8;
const double s12 = 12;
const double s16 = 16;
const double s20 = 20;
const double s24 = 24;
const double s28 = 28;
const double s32 = 32;
const double s36 = 36;
const double s40 = 40;
const double s48 = 48;
const double s56 = 56;
const double s64 = 64;
const double s80 = 80;
const double s96 = 96;
const double s112 = 112;
const double s128 = 128;
const double s144 = 144;
const double s160 = 160;
const double s176 = 176;
const double s192 = 192;
const double s208 = 208;
const double s224 = 224;
const double s240 = 240;
const double s256 = 256;
const double s272 = 272;
const double s288 = 288;
const double s304 = 304;
const double s320 = 320;
const double s336 = 336;
const double s352 = 352;
const double s368 = 368;
const double s384 = 384;
const double s400 = 400;
const double s416 = 416;

//width
final double w2 = 2.w;
final double w4 = 4.w;
final double w8 = 8.w;
final double w10 = 10.w;
final double w12 = 12.w;
final double w16 = 16.w;
final double w20 = 20.w;
final double w24 = 24.w;
final double w28 = 28.w;
final double w32 = 32.w;
final double w36 = 36.w;
final double w40 = 40.w;
final double w48 = 48.w;
final double w56 = 56.w;
final double w64 = 64.w;
final double w80 = 80.w;
final double w96 = 96.w;
final double w100 = 100.w;
final double w120 = 120.w;
final double w140 = 140.w;
final double w160 = 160.w;
final double w180 = 180.w;
final double w200 = 200.w;
final double w220 = 220.w;
final double w240 = 240.w;
final double w260 = 260.w;
final double w280 = 280.w;
final double w300 = 300.w;
final double w320 = 320.w;
final double w340 = 340.w;
final double w360 = 360.w;

//height
final double h2 = 2.h;
final double h4 = 4.h;
final double h8 = 8.h;
final double h10 = 10.h;
final double h12 = 12.h;
final double h16 = 16.h;
final double h20 = 20.h;
final double h24 = 24.h;
final double h28 = 28.h;
final double h32 = 32.h;
final double h36 = 36.h;
final double h40 = 40.h;
final double h48 = 48.h;
final double h56 = 56.h;
final double h64 = 64.h;
final double h80 = 80.h;
final double h96 = 96.h;
final double h100 = 100.h;
final double h120 = 120.h;
final double h140 = 140.h;
final double h160 = 160.h;
final double h180 = 180.h;
final double h200 = 200.h;
final double h220 = 220.h;
final double h230 = 230.h;
final double h240 = 240.h;
final double h260 = 260.h;
final double h280 = 280.h;
final double h300 = 300.h;
final double h320 = 320.h;
final double h340 = 340.h;
final double h360 = 360.h;
final double h380 = 380.h;
final double h400 = 400.h;
final double h420 = 420.h;
final double h440 = 440.h;
final double h460 = 460.h;
final double h480 = 480.h;
final double h500 = 500.h;

//padding
final double p4 = 4.r;
final double p8 = 8.r;
final double p12 = 12.r;
final double p16 = 16.r;
final double p20 = 20.r;
final double p24 = 24.r;
final double p28 = 28.r;
final double p32 = 32.r;

//margin
final double m4 = 4.r;
final double m8 = 8.r;
final double m12 = 12.r;
final double m16 = 16.r;
final double m20 = 20.r;
final double m24 = 24.r;
final double m28 = 28.r;
final double m32 = 32.r;

//radius
final double r4 = 4.r;
final double r8 = 8.r;
final double r12 = 12.r;
final double r16 = 16.r;
final double r20 = 20.r;
final double r24 = 24.r;
final double r28 = 28.r;
final double r32 = 32.r;
final double r72 = 72.r;
final double r100 = 100.r;
final double r120 = 120.r;
final double r140 = 140.r;
final double r160 = 160.r;
final double r180 = 180.r;
final double r200 = 200.r;

class AppSpacing {
  static addHeigh(double heigh) {
    return SizedBox(height: heigh);
  }

  static addWidth(double width) {
    return SizedBox(width: width);
  }

  static addEdgeInsetsAll(double padding) {
    return EdgeInsets.all(padding);
  }

  static addEdgeInsetsSymmetric({double? horizontal, double? vertical}) {
    return EdgeInsets.symmetric(
        vertical: vertical ?? 0, horizontal: horizontal ?? 0);
  }

  static addEdgeInsetsOnly(
      {double? top, double? right, double? bottom, double? left}) {
    return EdgeInsets.only(
      top: top ?? 0,
      right: right ?? 0,
      bottom: bottom ?? 0,
      left: left ?? 0,
    );
  }

  static addEdgeInsetsFromLTRB(
      {required double left,
      required double top,
      required double right,
      required double bottom}) {
    return EdgeInsets.fromLTRB(left, top, right, bottom);
  }

  static addSpace({int? flex}) {
    return Spacer(flex: flex ?? 1);
  }
}

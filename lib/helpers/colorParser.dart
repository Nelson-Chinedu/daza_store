import 'package:flutter/material.dart';

parseHexColor(String hexString) {
  try {
    String hex = hexString.replaceAll('#', '').trim();
    if (hex.length == 6) hex = 'FF$hex';
    return Color(int.parse(hex, radix: 16));
  } catch (_) {
    return null;
  }
}

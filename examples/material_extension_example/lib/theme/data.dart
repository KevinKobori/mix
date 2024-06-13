import 'package:flutter/material.dart';
import 'package:material_extension_example/theme/tokens.dart';
import 'package:mix/mix.dart';

final themeData = MixThemeData(
  colors: {
    $token.color.example: const Color.fromARGB(255, 221, 0, 255),
  },
  radii: {
    $token.radius.example: const Radius.circular(12),
  },
  spaces: {
    $token.space.example: 24,
  },
  textStyles: {
    $token.textStyle.example: const TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
      // color: $token.color.colorExample,
      color: Color.fromARGB(255, 17, 255, 0),
    )
  },
);

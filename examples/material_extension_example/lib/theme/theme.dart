import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// TOKENS
extension BreakpointTokenUtilExtension on BreakpointTokenUtil {
  BreakpointToken get example => const BreakpointToken('breakpoint.example');
}

extension ColorTokenUtilExtension on ColorTokenUtil {
  ColorToken get example => const ColorToken('color.example');
  ColorToken get example2 => const ColorToken('color.example2');
}

extension GapTokenUtilExtension on GapTokenUtil {
  GapToken get example => const GapToken('space.example');
}

extension RadiusTokenUtilExtension on RadiusTokenUtil {
  RadiusToken get example => const RadiusToken('radius.example');
}

extension SpaceTokenUtilExtension on SpaceTokenUtil {
  SpaceToken get example => const SpaceToken('space.example');
}

extension TextStyleTokenUtilExtension on TextStyleTokenUtil {
  TextStyleToken get example => const TextStyleToken('textStyle.example');
}

/// THEME DATA
final themeData = MixThemeData(
  breakpoints: {
    $token.breakpoint.example: const Breakpoint(minWidth: 0, maxWidth: 1024),
    $token.breakpoint.large: const Breakpoint(minWidth: 0, maxWidth: 1024),
  },
  colors: {
    $token.color.example: const Color.fromARGB(255, 221, 0, 255),
    $token.color.example2: const Color.fromARGB(255, 238, 255, 0),
  },
  // gaps: {
  //   $token.gap.example: Gap(32),
  // },
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

// Map<String, String> exemplo  = {
//   'chave1': 'valor1',
//   'chave2': 'valor2',
// };

// List<String> getKeysFromMap(Map<String, String> map) {
//   return map.keys.toList();
// }

// void main() {
//   final list = getKeysFromMap(exemplo);
//   print(list); // Deve imprimir: [chave1, chave2]
// }

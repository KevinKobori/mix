import 'package:flutter/material.dart';
import 'package:mix/mix.dart';

/// TOKENS
extension BreakpointTokenUtilExtension on BreakpointTokenUtil {
  BreakpointToken get example => const BreakpointToken('example');
}

extension ColorTokenUtilExtension on ColorTokenUtil {
  ColorToken get example => const ColorToken('example');
  ColorToken get example2 => const ColorToken('example2');
}

// extension GapTokenUtilExtension on GapTokenUtil {
//   GapToken get example => const GapToken('example');
// }

extension RadiusTokenUtilExtension on RadiusTokenUtil {
  RadiusToken get example => const RadiusToken('example');
}

extension SpaceTokenUtilExtension on SpaceTokenUtil {
  SpaceToken get example => const SpaceToken('example');
}

extension TextStyleTokenUtilExtension on TextStyleTokenUtil {
  TextStyleToken get example => const TextStyleToken('example');
}

/// THEME DATA
final themeData = MixThemeData.withMaterial(
  breakpoints: {
    $token.breakpoint.example: const Breakpoint(minWidth: 0, maxWidth: 1024),
    $token.breakpoint.large: const Breakpoint(minWidth: 0, maxWidth: 1024),
  },
  colors: {
    $token.color.example: const Color.fromARGB(255, 221, 0, 255),
    $token.color.example2: const Color.fromARGB(255, 238, 255, 0),
  },
  gaps: const {
    // $token.gap.example: Gap(32),
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

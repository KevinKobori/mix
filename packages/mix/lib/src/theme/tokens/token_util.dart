import 'package:flutter/material.dart';

import '../material/material_tokens.dart';
import 'breakpoints_token.dart';

const $material = MaterialTokens();
const $token = MixTokens();

@immutable
class MixTokens {
  final space = const SpaceTokenUtil();
  final radius = const RadiusTokenUtil();
  final gap = const GapTokenUtil();
  final color = const ColorTokenUtil();
  final breakpoint = const BreakpointTokenUtil();
  final textStyle = const TextStyleTokenUtil();

  const MixTokens();
}

@immutable
class RadiusTokenUtil {
  /// [design_toolkit]
  const RadiusTokenUtil();
}

@immutable
class SpaceTokenUtil {
  /// [design_toolkit]
  const SpaceTokenUtil();
}

@immutable
class ColorTokenUtil {
  const ColorTokenUtil();
}

@immutable
class TextStyleTokenUtil {
  const TextStyleTokenUtil();
}

@immutable
class BreakpointTokenUtil {
  final xsmall = BreakpointToken.xsmall;
  final small = BreakpointToken.small;
  final medium = BreakpointToken.medium;
  final large = BreakpointToken.large;
  const BreakpointTokenUtil();
}

/// [design_toolkit]
@immutable
class GapTokenUtil {
  const GapTokenUtil();
}

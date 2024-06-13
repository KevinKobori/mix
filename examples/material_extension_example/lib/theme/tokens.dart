import 'package:mix/mix.dart';

extension ColorTokenUtilExtension on ColorTokenUtil {
  ColorToken get example => const ColorToken('color.colorExample');
}

extension RadiusTokenUtilExtension on RadiusTokenUtil {
  RadiusToken get example => const RadiusToken('radius.radiusExample');
}

extension SpaceTokenUtilExtension on SpaceTokenUtil {
  SpaceToken get example => const SpaceToken('space.spacingExample');
}

extension TextStyleTokenUtilExtension on TextStyleTokenUtil {
  TextStyleToken get example => const TextStyleToken('textStyle.textStyleExample');
}

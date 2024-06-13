import 'package:mix/mix.dart';

extension RadiusTokenUtilExtension on RadiusTokenUtil {
  RadiusToken get small => const RadiusToken('mix.radius.small');
  RadiusToken get medium => const RadiusToken('mix.radius.medium');
  RadiusToken get large => const RadiusToken('mix.radius.large');
}

extension SpaceTokenUtilExtension on SpaceTokenUtil {
  SpaceToken get small => const SpaceToken('mix.space.small');
  SpaceToken get medium => const SpaceToken('mix.space.medium');
  SpaceToken get large => const SpaceToken('mix.space.large');
}

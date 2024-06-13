import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../internal/compare_mixin.dart';
import 'material/material_theme.dart';
import 'tokens/breakpoints_token.dart';
import 'tokens/color_token.dart';
import 'tokens/gap_token.dart';
import 'tokens/mix_token.dart';
import 'tokens/radius_token.dart';
import 'tokens/space_token.dart';
import 'tokens/text_style_token.dart';

class MixTheme extends InheritedWidget {
  const MixTheme({required super.child, required this.data, super.key});

  static MixThemeData of(BuildContext context) {
    final themeData =
        context.dependOnInheritedWidgetOfExactType<MixTheme>()?.data;

    assert(themeData != null, 'No MixTheme found in context');

    return themeData!;
  }

  static MixThemeData? maybeOf(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MixTheme>()?.data;
  }

  final MixThemeData data;

  @override
  bool updateShouldNotify(MixTheme oldWidget) => data != oldWidget.data;
}

@immutable
class MixThemeData with EqualityMixin {
  final StyledTokens<RadiusToken, Radius> radii;

  /// [design_toolkit]
  final StyledTokens<GapToken, Gap> gaps;
  final StyledTokens<ColorToken, Color> colors;
  final StyledTokens<TextStyleToken, TextStyle> textStyles;
  final StyledTokens<BreakpointToken, Breakpoint> breakpoints;
  final StyledTokens<SpaceToken, double> spaces;

  const MixThemeData.raw({
    required this.textStyles,
    required this.colors,
    required this.breakpoints,
    required this.radii,
    required this.gaps,
    required this.spaces,
  });

  const MixThemeData.empty()
      : this.raw(
          textStyles: const StyledTokens.empty(),
          colors: const StyledTokens.empty(),
          breakpoints: const StyledTokens.empty(),
          radii: const StyledTokens.empty(),
          gaps: const StyledTokens.empty(),
          spaces: const StyledTokens.empty(),
        );

  factory MixThemeData({
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<SpaceToken, double>? spaces,
    Map<TextStyleToken, TextStyle>? textStyles,
    Map<RadiusToken, Radius>? radii,
    // Map<GapToken, Gap>? gaps,
  }) {
    // final List<SpaceToken>? spacesKeys = spaces?.keys.toList();
    // final List<GapToken>? gapKeys = spacesKeys?.map((element) => element).toList();
    /// chatgpt, eu quero transformar um map de Map<SpaceToken, double>? spaces em um map de Map<GapToken, Gap>? gaps,
    /// onde Gap é uma classe que recebe um double, exemplo: Gap(16)
    Map<GapToken, Gap> transformSpacesToGaps(Map<SpaceToken, double>? spaces) {
      if (spaces == null) return const {};

      // final List<SpaceToken>? spacesKeys = spaces.keys.toList();
      final Map<SpaceToken, GapToken> spaceToGapTokenMap = {};

      // spaces.keys.map((element) {
      //   spaceToGapTokenMap[element] = GapToken('gap.' + element.name);
      // });

      // // Defina o mapeamento de SpaceToken para GapToken
      // final Map<SpaceToken, GapToken> spaceToGapTokenMap = {
      //   const SpaceToken('small'): const GapToken('small'),
      //   const SpaceToken('medium'): const GapToken('medium'),
      //   const SpaceToken('large'): const GapToken('large'),
      //   // Adicione outros mapeamentos conforme necessário
      // };

      // Converte o Map<SpaceToken, double> para Map<GapToken, Gap>
      final finalMap = spaces.map((spaceToken, value) {
        // final gapToken = GapToken('gap.${spaceToken.name}');
        final gapToken = GapToken(spaceToken.name);
        // spaceToGapTokenMap['gap.${spaceToken.name}'];
        // spaceToGapTokenMap[spaceToken];
        // if (gapToken != null) {
        return MapEntry(gapToken, Gap(value));
        // }
        // throw Exception(
        //     'No corresponding GapToken for SpaceToken: $spaceToken');
      });
      return finalMap;
    }

    return MixThemeData.raw(
      textStyles: StyledTokens(textStyles ?? const {}),
      colors: StyledTokens(colors ?? const {}),
      breakpoints:
          _breakpointTokenMap.merge(StyledTokens(breakpoints ?? const {})),
      radii: StyledTokens(radii ?? const {}),
      // gaps: StyledTokens(gaps ?? const {}),
      gaps: StyledTokens(transformSpacesToGaps(spaces)),
      spaces: StyledTokens(spaces ?? const {}),
    );
  }

  factory MixThemeData.withMaterial({
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<SpaceToken, double>? spaces,
    Map<TextStyleToken, TextStyle>? textStyles,
    Map<RadiusToken, Radius>? radii,
    Map<GapToken, Gap>? gaps,
  }) {
    return materialMixTheme.merge(
      MixThemeData(
        breakpoints: breakpoints,
        colors: colors,
        spaces: spaces,
        textStyles: textStyles,
        radii: radii,
        // gaps: gaps,
      ),
    );
  }

  MixThemeData copyWith({
    Map<BreakpointToken, Breakpoint>? breakpoints,
    Map<ColorToken, Color>? colors,
    Map<SpaceToken, double>? spaces,
    Map<TextStyleToken, TextStyle>? textStyles,
    Map<RadiusToken, Radius>? radii,
    Map<GapToken, Gap>? gaps,
  }) {
    return MixThemeData.raw(
      textStyles:
          textStyles == null ? this.textStyles : StyledTokens(textStyles),
      colors: colors == null ? this.colors : StyledTokens(colors),
      breakpoints:
          breakpoints == null ? this.breakpoints : StyledTokens(breakpoints),
      radii: radii == null ? this.radii : StyledTokens(radii),
      gaps: gaps == null ? this.gaps : StyledTokens(gaps),
      spaces: spaces == null ? this.spaces : StyledTokens(spaces),
    );
  }

  MixThemeData merge(MixThemeData other) {
    return MixThemeData.raw(
      textStyles: textStyles.merge(other.textStyles),
      colors: colors.merge(other.colors),
      breakpoints: breakpoints.merge(other.breakpoints),
      radii: radii.merge(other.radii),
      gaps: gaps.merge(other.gaps),
      spaces: spaces.merge(other.spaces),
    );
  }

  @override
  get props => [spaces, breakpoints, colors, textStyles, radii, gaps];
}

final _breakpointTokenMap = StyledTokens({
  BreakpointToken.xsmall: const Breakpoint(maxWidth: 599),
  BreakpointToken.small: const Breakpoint(minWidth: 600, maxWidth: 1023),
  BreakpointToken.medium: const Breakpoint(minWidth: 1024, maxWidth: 1439),
  BreakpointToken.large:
      const Breakpoint(minWidth: 1440, maxWidth: double.infinity),
});

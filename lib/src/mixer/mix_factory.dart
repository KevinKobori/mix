import 'package:flutter/material.dart';
import 'package:mix/mix.dart';
import 'package:mix/src/mixer/mix_values.dart';

const kVariantDeprecationNotice =
    'Deprecated pass variants directly to the Mixable Widget Contructor';

/// Defines a mix
/// {@category Mix Object}
class Mix {
  final MixValues values;

  const Mix._(this.values);

  /// Instantiate a mix with _Attribute_ parameters
  factory Mix([
    Attribute? p1,
    Attribute? p2,
    Attribute? p3,
    Attribute? p4,
    Attribute? p5,
    Attribute? p6,
    Attribute? p7,
    Attribute? p8,
    Attribute? p9,
    Attribute? p10,
    Attribute? p11,
    Attribute? p12,
  ]) {
    final params = <Attribute>[];
    if (p1 != null) params.add(p1);
    if (p2 != null) params.add(p2);
    if (p3 != null) params.add(p3);
    if (p4 != null) params.add(p4);
    if (p5 != null) params.add(p5);
    if (p6 != null) params.add(p6);
    if (p7 != null) params.add(p7);
    if (p8 != null) params.add(p8);
    if (p9 != null) params.add(p9);
    if (p10 != null) params.add(p10);
    if (p11 != null) params.add(p11);
    if (p12 != null) params.add(p12);

    return Mix.fromList(params);
  }

  /// Instantiate a mix from a _List_ of _Attribute_ instances (cannot be null)
  factory Mix.fromList(List<Attribute> attributes) {
    return Mix._(MixValues.fromList(attributes));
  }

  factory Mix.fromValues(MixValues values) {
    return Mix._(values);
  }

  /// Instantiate a mix from a _List_ of _Attribute_ instances
  /// (_attributes_ argument can be null)
  factory Mix.fromMaybeList(List<Attribute?> attributes) {
    final validAttributes = attributes.whereType<Attribute>();
    return Mix.fromList(validAttributes.toList());
  }

  Mix clone() {
    return Mix._(values);
  }

  List<Attribute> get source {
    return values.source;
  }

  Mix copyWith({
    MixValues? attributes,
  }) {
    return Mix._(values.merge(attributes));
  }

  int get length => values.source.length;

  /// Returns a new mix instance from this instance with the
  /// _Variant_ instance added
  @Deprecated(kVariantDeprecationNotice)
  Mix withVariant(Variant<Attribute> variant) {
    return copyWith(
      attributes: values,
    );
  }

  @Deprecated(kVariantDeprecationNotice)
  Mix withMaybeVariant(Variant<Attribute>? variant) {
    if (variant == null) return this;

    return withVariant(variant);
  }

  @Deprecated(kVariantDeprecationNotice)
  Mix withVariants(List<Variant<Attribute>> variants) {
    return copyWith(attributes: values);
  }

  @Deprecated(kVariantDeprecationNotice)
  Mix withMaybeVariants(List<Variant<Attribute>>? variants) {
    if (variants == null || variants.isEmpty) return this;

    return withVariants(variants);
  }

  /// Same as _combine_, but accepts a _List_ of _Mix_ instances
  static Mix combineAll<T extends Attribute>(List<Mix> mixes) {
    MixValues attributes = const MixValues.empty();
    for (final mix in mixes) {
      attributes = attributes.merge(mix.values);
    }

    return Mix._(attributes);
  }

  /// Merges many mixes into one
  // ignore: long-parameter-list
  static Mix combine<T extends Attribute>([
    Mix? mix1,
    Mix? mix2,
    Mix? mix3,
    Mix? mix4,
    Mix? mix5,
    Mix? mix6,
  ]) {
    MixValues attributes = const MixValues.empty();

    if (mix1 != null) attributes = attributes.merge(mix1.values);
    if (mix2 != null) attributes = attributes.merge(mix2.values);
    if (mix3 != null) attributes = attributes.merge(mix3.values);
    if (mix4 != null) attributes = attributes.merge(mix4.values);
    if (mix5 != null) attributes = attributes.merge(mix5.values);
    if (mix6 != null) attributes = attributes.merge(mix6.values);

    return Mix._(attributes);
  }

  /// Chooses mix based on condition
  static Mix chooser<T extends Attribute>({
    required bool condition,
    required Mix ifTrue,
    required Mix ifFalse,
  }) {
    if (condition) {
      return ifTrue;
    } else {
      return ifFalse;
    }
  }

  @Deprecated(kVariantDeprecationNotice)
  static Mix variantSwitcher<T extends Attribute>(
    Mix mix,
    Map<bool, Variant<Attribute>> cases,
  ) {
    final keys = cases.keys.toList();
    final values = cases.values.toList();

    List<Variant<Attribute>> variants = [];

    for (var i = 0; i < keys.length; i++) {
      if (keys[i]) {
        variants.add(values[i]);
      }
    }

    return mix.withVariants(variants);
  }

  /// Used for const constructor widgets
  /// @nodoc
  static const Mix constant = Mix._(MixValues.empty());

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Mix && other.values == values;
  }

  @override
  int get hashCode => values.hashCode;
}

/// @nodoc
extension MixExtension<T extends Attribute> on Mix {
  /// Adds an Attribute to a Mix
  WrapFunction<T, Mix> get mix {
    return WrapFunction(addAttributes);
  }

  /// Adds a list of attributes to a Mix
  Mix addAttributes(List<Attribute> attributes) {
    return copyWith(attributes: MixValues.fromList(attributes));
  }

  /// Combines argument mix with this mix.
  Mix apply(Mix mix) {
    return Mix.combineAll([this, mix]);
  }

  /// Like apply, but the argument mix is nullable
  Mix maybeApply(Mix? mix) {
    if (mix == null) return this;
    return apply(mix);
  }

  @Deprecated('Use maybeApply instead')
  Mix applyMaybe(Mix? mix) {
    return maybeApply(mix);
  }

  /// @nodoc
  Box box({
    Mix? overrideMix,
    required Widget child,
  }) {
    final mx = Mix.combine(this, overrideMix);
    return Box(mix: mx, child: child);
  }

  /// @nodoc
  HBox hbox({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    final mix = Mix.combine(this, overrideMix);
    return HBox(mix: mix, children: children);
  }

  /// @nodoc
  HBox row({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    return hbox(
      overrideMix: overrideMix,
      children: children,
    );
  }

  /// @nodoc
  TextMix text(
    String text, {
    Mix? overrideMix,
  }) {
    final mix = Mix.combine(this, overrideMix);
    return TextMix(text, mix: mix);
  }

  /// @nodoc
  VBox vbox({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    final mix = Mix.combine(this, overrideMix);
    return VBox(mix: mix, children: children);
  }

  /// @nodoc
  VBox column({
    Mix? overrideMix,
    required List<Widget> children,
  }) {
    return vbox(
      children: children,
      overrideMix: overrideMix,
    );
  }

  /// @nodoc
  IconMix icon(
    IconData icon, {
    Mix? overrideMix,
  }) {
    final mx = Mix.combine(this, overrideMix);
    return IconMix(
      icon,
      mix: mx,
    );
  }
}

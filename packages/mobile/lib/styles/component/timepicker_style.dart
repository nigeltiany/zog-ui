import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:zog_ui/zog_ui.dart';

class HourMinuteControlStyle with Diagnosticable {
  /// The color of the header text that represents hours and minutes.
  ///
  /// If [hourMinuteTextColor] is a [MaterialStateColor], then the effective
  /// text color can depend on the [MaterialState.selected] state, i.e. if the
  /// text is selected or not.
  ///
  /// By default the overall theme's [ColorScheme.primary] color is used when
  /// the text is selected and [ColorScheme.onSurface] when it's not selected.
  final Color? hourMinuteTextColor;

  /// The background color of the hour and minutes header segments.
  ///
  /// If [hourMinuteColor] is a [MaterialStateColor], then the effective
  /// background color can depend on the [MaterialState.selected] state, i.e.
  /// if the segment is selected or not.
  ///
  /// By default, if the segment is selected, the overall theme's
  /// `ColorScheme.primary.withOpacity(0.12)` is used when the overall theme's
  /// brightness is [Brightness.light] and
  /// `ColorScheme.primary.withOpacity(0.24)` is used when the overall theme's
  /// brightness is [Brightness.dark].
  /// If the segment is not selected, the overall theme's
  /// `ColorScheme.onSurface.withOpacity(0.12)` is used.
  final Color? hourMinuteColor;

  /// Used to configure the [TextStyle]s for the hour/minute controls.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [ZeroTypography.headline3].
  final TextStyle? hourMinuteTextStyle;

  /// The shape of the hour and minute controls that the time picker uses.
  ///
  /// If this is null, the time picker defaults to
  /// `RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))`.
  final ShapeBorder? hourMinuteShape;

  const HourMinuteControlStyle({
    this.hourMinuteTextColor,
    this.hourMinuteColor,
    this.hourMinuteTextStyle,
    this.hourMinuteShape,
  });

  HourMinuteControlStyle copyWith({
    Color? hourMinuteTextColor,
    Color? hourMinuteColor,
    TextStyle? hourMinuteTextStyle,
    ShapeBorder? hourMinuteShape,
  }) {
    return HourMinuteControlStyle(
      hourMinuteTextColor: hourMinuteTextColor ?? this.hourMinuteTextColor,
      hourMinuteColor: hourMinuteColor ?? this.hourMinuteColor,
      hourMinuteTextStyle: hourMinuteTextStyle ?? this.hourMinuteTextStyle,
      hourMinuteShape: hourMinuteShape ?? this.hourMinuteShape,
    );
  }

  static HourMinuteControlStyle lerp(
      HourMinuteControlStyle? a, HourMinuteControlStyle? b, double t) {
    return HourMinuteControlStyle(
      hourMinuteTextColor:
          Color.lerp(a?.hourMinuteTextColor, b?.hourMinuteTextColor, t),
      hourMinuteColor: Color.lerp(a?.hourMinuteColor, b?.hourMinuteColor, t),
      hourMinuteTextStyle:
          TextStyle.lerp(a?.hourMinuteTextStyle, b?.hourMinuteTextStyle, t),
      hourMinuteShape:
          ShapeBorder.lerp(a?.hourMinuteShape, b?.hourMinuteShape, t),
    );
  }

  @override
  int get hashCode => Object.hash(hourMinuteTextColor, hourMinuteColor);

  static HourMinuteControlStyle fallback(
    Color? hourMinuteColor,
    Color? hourMinuteTextColor,
    TextStyle? hourMinuteTextStyle,
    ShapeBorder? hourMinuteShape,
  ) {
    return HourMinuteControlStyle(
        hourMinuteColor: hourMinuteColor,
        hourMinuteTextColor: hourMinuteTextColor,
        hourMinuteTextStyle: hourMinuteTextStyle,
        hourMinuteShape: hourMinuteShape ??
            const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(.0))));
  }

  HourMinuteControlStyle merge(HourMinuteControlStyle? other) {
    if (other == null) return this;

    return copyWith(
      hourMinuteColor: other.hourMinuteColor,
      hourMinuteTextColor: other.hourMinuteTextColor,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is HourMinuteControlStyle &&
        other.hourMinuteTextColor == hourMinuteTextColor &&
        other.hourMinuteColor == hourMinuteColor;
  }
}

/// Defines the visual properties of the widget displayed with [showZeroTimePicker].
///
/// Descendant widgets obtain the current [ZeroTimePickerStyle] object using
/// `context.theme.timePickerStyle`. Instances of [ZeroTimePickerStyle]
/// can be customized with [ZeroTimePickerStyle.copyWith].
///
/// Typically a [ZeroTimePickerStyle] is specified as part of the overall
/// [ZeroTheme] with [ZeroThemeData.timePickerTheme].
///
/// All [ZeroTimePickerStyle] properties are `null` by default. When null,
/// [showZeroTimePicker] will provide its own defaults.
class ZeroTimePickerStyle with Diagnosticable {
  /// Creates a theme that can be used for [ZeroTimePickerStyle] or
  /// [ZeroThemeData.timePickerStyle].
  const ZeroTimePickerStyle({
    required this.hourMinute,
    this.backgroundColor,
    this.dayPeriodTextColor,
    this.dayPeriodColor,
    this.dialHandColor,
    this.dialBackgroundColor,
    this.dialTextColor,
    this.entryModeIconColor,
    this.dayPeriodTextStyle,
    this.helpTextStyle,
    this.shape,
    this.dayPeriodShape,
    this.dayPeriodBorderSide,
    this.textfieldStyle,
  });

  /// The background color of a time picker.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [ColorScheme.background].
  final Color? backgroundColor;

  /// The color of the day period text that represents AM/PM.
  ///
  /// If [dayPeriodTextColor] is a [MaterialStateColor], then the effective
  /// text color can depend on the [MaterialState.selected] state, i.e. if the
  /// text is selected or not.
  ///
  /// By default the overall theme's [ColorScheme.primary] color is used when
  /// the text is selected and `ColorScheme.onSurface.withOpacity(0.60)` when
  /// it's not selected.
  final Color? dayPeriodTextColor;

  final HourMinuteControlStyle hourMinute;

  /// The background color of the AM/PM toggle.
  ///
  /// If [dayPeriodColor] is a [MaterialStateColor], then the effective
  /// background color can depend on the [MaterialState.selected] state, i.e.
  /// if the segment is selected or not.
  ///
  /// By default, if the segment is selected, the overall theme's
  /// `ColorScheme.primary.withOpacity(0.12)` is used when the overall theme's
  /// brightness is [Brightness.light] and
  /// `ColorScheme.primary.withOpacity(0.24)` is used when the overall theme's
  /// brightness is [Brightness.dark].
  /// If the segment is not selected, [Colors.transparent] is used to allow the
  /// [Dialog]'s color to be used.
  final Color? dayPeriodColor;

  /// The color of the time picker dial's hand.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [ColorScheme.primary].
  final Color? dialHandColor;

  /// The background color of the time picker dial.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [ColorScheme.primary].
  final Color? dialBackgroundColor;

  /// The color of the dial text that represents specific hours and minutes.
  ///
  /// If [dialTextColor] is a [MaterialStateColor], then the effective
  /// text color can depend on the [MaterialState.selected] state, i.e. if the
  /// text is selected or not.
  ///
  /// If this color is null then the dial's text colors are based on the
  /// theme's [ThemeData.colorScheme].
  final Color? dialTextColor;

  /// The color of the entry mode [IconButton].
  ///
  /// If this is null, the time picker defaults to:
  ///
  /// ```dart
  /// Theme.of(context).colorScheme.onSurface.withOpacity(
  ///   Theme.of(context).colorScheme.brightness == Brightness.dark ? 1.0 : 0.6,
  /// )
  /// ```
  final Color? entryModeIconColor;

  /// Used to configure the [TextStyle]s for the day period control.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [ZeroTypography.titleMedium].
  final TextStyle? dayPeriodTextStyle;

  /// Used to configure the [TextStyle]s for the helper text in the header.
  ///
  /// If this is null, the time picker defaults to the overall theme's
  /// [ZeroTypography.labelSmall].
  final TextStyle? helpTextStyle;

  /// The shape of the [Dialog] that the time picker is presented in.
  ///
  /// If this is null, the time picker defaults to
  /// `RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4.0)))`.
  final ShapeBorder? shape;

  /// The shape of the day period that the time picker uses.
  /// If this is null, the time picker defaults to:
  ///
  /// ```dart
  /// const RoundedRectangleBorder(
  ///   borderRadius: BorderRadius.all(Radius.circular(4.0)),
  ///   side: BorderSide(),
  /// )
  /// ```
  final OutlinedBorder? dayPeriodShape;

  /// The color and weight of the day period's outline.
  /// If this is null, the time picker defaults to:
  ///
  /// ```dart
  /// BorderSide(
  ///   color: Color.alphaBlend(
  ///     context.theme.colorScheme.onBackground.withOpacity(0.38),
  ///     context.theme.colorScheme.surface,
  ///   ),
  /// ),
  /// ```
  final BorderSide? dayPeriodBorderSide;

  /// The input decoration theme for the [TextField]s in the time picker.
  ///
  /// If this is null, the time picker provides its own defaults.
  final ZeroTextfieldStyle? textfieldStyle;

  /// Creates a copy of this object with the given fields replaced with the
  /// new values.
  ZeroTimePickerStyle copyWith({
    Color? backgroundColor,
    Color? dayPeriodTextColor,
    Color? dayPeriodColor,
    Color? dialHandColor,
    Color? dialBackgroundColor,
    Color? dialTextColor,
    Color? entryModeIconColor,
    TextStyle? dayPeriodTextStyle,
    TextStyle? helpTextStyle,
    ShapeBorder? shape,
    HourMinuteControlStyle? hourMinute,
    OutlinedBorder? dayPeriodShape,
    BorderSide? dayPeriodBorderSide,
    ZeroTextfieldStyle? textfieldStyle,
  }) {
    return ZeroTimePickerStyle(
      backgroundColor: backgroundColor ?? this.backgroundColor,
      hourMinute: hourMinute ?? this.hourMinute,
      dayPeriodTextColor: dayPeriodTextColor ?? this.dayPeriodTextColor,
      dayPeriodColor: dayPeriodColor ?? this.dayPeriodColor,
      dialHandColor: dialHandColor ?? this.dialHandColor,
      dialBackgroundColor: dialBackgroundColor ?? this.dialBackgroundColor,
      dialTextColor: dialTextColor ?? this.dialTextColor,
      entryModeIconColor: entryModeIconColor ?? this.entryModeIconColor,
      dayPeriodTextStyle: dayPeriodTextStyle ?? this.dayPeriodTextStyle,
      helpTextStyle: helpTextStyle ?? this.helpTextStyle,
      shape: shape ?? this.shape,
      dayPeriodShape: dayPeriodShape ?? this.dayPeriodShape,
      dayPeriodBorderSide: dayPeriodBorderSide ?? this.dayPeriodBorderSide,
      textfieldStyle: textfieldStyle ?? this.textfieldStyle,
    );
  }

  /// Linearly interpolate between two time picker themes.
  ///
  /// The argument `t` must not be null.
  static ZeroTimePickerStyle lerp(
      ZeroTimePickerStyle? a, ZeroTimePickerStyle? b, double t) {
    // Workaround since BorderSide's lerp does not allow for null arguments.
    BorderSide? lerpedBorderSide;
    if (a?.dayPeriodBorderSide == null && b?.dayPeriodBorderSide == null) {
      lerpedBorderSide = null;
    } else if (a?.dayPeriodBorderSide == null) {
      lerpedBorderSide = b?.dayPeriodBorderSide;
    } else if (b?.dayPeriodBorderSide == null) {
      lerpedBorderSide = a?.dayPeriodBorderSide;
    } else {
      lerpedBorderSide =
          BorderSide.lerp(a!.dayPeriodBorderSide!, b!.dayPeriodBorderSide!, t);
    }
    return ZeroTimePickerStyle(
      backgroundColor: Color.lerp(a?.backgroundColor, b?.backgroundColor, t),
      hourMinute: HourMinuteControlStyle.lerp(a?.hourMinute, b?.hourMinute, t),
      dayPeriodTextColor:
          Color.lerp(a?.dayPeriodTextColor, b?.dayPeriodTextColor, t),
      dayPeriodColor: Color.lerp(a?.dayPeriodColor, b?.dayPeriodColor, t),
      dialHandColor: Color.lerp(a?.dialHandColor, b?.dialHandColor, t),
      dialBackgroundColor:
          Color.lerp(a?.dialBackgroundColor, b?.dialBackgroundColor, t),
      dialTextColor: Color.lerp(a?.dialTextColor, b?.dialTextColor, t),
      entryModeIconColor:
          Color.lerp(a?.entryModeIconColor, b?.entryModeIconColor, t),
      dayPeriodTextStyle:
          TextStyle.lerp(a?.dayPeriodTextStyle, b?.dayPeriodTextStyle, t),
      helpTextStyle: TextStyle.lerp(a?.helpTextStyle, b?.helpTextStyle, t),
      shape: ShapeBorder.lerp(a?.shape, b?.shape, t),
      dayPeriodShape: ShapeBorder.lerp(a?.dayPeriodShape, b?.dayPeriodShape, t)
          as OutlinedBorder?,
      dayPeriodBorderSide: lerpedBorderSide,
      textfieldStyle: t < 0.5 ? a?.textfieldStyle : b?.textfieldStyle,
    );
  }

  @override
  int get hashCode => Object.hash(
        backgroundColor,
        hourMinute,
        dayPeriodTextColor,
        dayPeriodColor,
        dialHandColor,
        dialBackgroundColor,
        dialTextColor,
        entryModeIconColor,
        dayPeriodTextStyle,
        helpTextStyle,
        shape,
        hourMinute,
        dayPeriodShape,
        dayPeriodBorderSide,
        textfieldStyle,
      );

  static ZeroTimePickerStyle fallback({
    required HourMinuteControlStyle hourMinute,
    Color? backgroundColor,
    BorderSide? dayPeriodBorderSide,
    Color? dayPeriodColor,
    OutlinedBorder? dayPeriodShape,
    Color? dayPeriodTextColor,
    TextStyle? dayPeriodTextStyle,
    Color? dialBackgroundColor,
    Color? dialHandColor,
    Color? dialTextColor,
    Color? entryModeIconColor,
    TextStyle? helpTextStyle,
    ShapeBorder? shape,
    ZeroTextfieldStyle? textfieldStyle,
  }) {
    return ZeroTimePickerStyle(
      backgroundColor: backgroundColor,
      hourMinute: hourMinute,
      dayPeriodBorderSide: dayPeriodBorderSide,
      dayPeriodColor: dayPeriodColor,
      dayPeriodShape: dayPeriodShape,
      dayPeriodTextColor: dayPeriodTextColor,
      dayPeriodTextStyle: dayPeriodTextStyle,
      dialBackgroundColor: dialBackgroundColor,
      dialHandColor: dialHandColor,
      dialTextColor: dialTextColor,
      entryModeIconColor: entryModeIconColor,
      helpTextStyle: helpTextStyle,
      shape: shape,
      textfieldStyle: textfieldStyle,
    );
  }

  ZeroTimePickerStyle merge(ZeroTimePickerStyle? other) {
    if (other == null) return this;

    return copyWith(
      backgroundColor: other.backgroundColor,
      dayPeriodBorderSide: other.dayPeriodBorderSide,
      dayPeriodColor: other.dayPeriodColor,
      dayPeriodShape: other.dayPeriodShape,
      dayPeriodTextColor: other.dayPeriodTextColor,
      dayPeriodTextStyle: dayPeriodTextStyle?.merge(other.dayPeriodTextStyle) ??
          other.dayPeriodTextStyle,
      dialBackgroundColor: other.dialBackgroundColor,
      dialHandColor: other.dialHandColor,
      dialTextColor: other.dialTextColor,
      entryModeIconColor: other.entryModeIconColor,
      helpTextStyle:
          helpTextStyle?.merge(other.helpTextStyle) ?? other.helpTextStyle,
      shape: other.shape,
      textfieldStyle:
          textfieldStyle?.merge(other.textfieldStyle) ?? other.textfieldStyle,
      hourMinute: other.hourMinute,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) {
      return true;
    }
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is ZeroTimePickerStyle &&
        other.backgroundColor == backgroundColor &&
        other.dayPeriodTextColor == dayPeriodTextColor &&
        other.dayPeriodColor == dayPeriodColor &&
        other.dialHandColor == dialHandColor &&
        other.dialBackgroundColor == dialBackgroundColor &&
        other.dialTextColor == dialTextColor &&
        other.entryModeIconColor == entryModeIconColor &&
        other.dayPeriodTextStyle == dayPeriodTextStyle &&
        other.helpTextStyle == helpTextStyle &&
        other.shape == shape &&
        other.dayPeriodShape == dayPeriodShape &&
        other.dayPeriodBorderSide == dayPeriodBorderSide &&
        other.textfieldStyle == textfieldStyle;
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        ColorProperty('backgroundColor', backgroundColor, defaultValue: null));
    properties.add(ColorProperty('dayPeriodTextColor', dayPeriodTextColor,
        defaultValue: null));
    properties.add(
        ColorProperty('dayPeriodColor', dayPeriodColor, defaultValue: null));
    properties
        .add(ColorProperty('dialHandColor', dialHandColor, defaultValue: null));
    properties.add(ColorProperty('dialBackgroundColor', dialBackgroundColor,
        defaultValue: null));
    properties
        .add(ColorProperty('dialTextColor', dialTextColor, defaultValue: null));
    properties.add(ColorProperty('entryModeIconColor', entryModeIconColor,
        defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>(
        'dayPeriodTextStyle', dayPeriodTextStyle,
        defaultValue: null));
    properties.add(DiagnosticsProperty<TextStyle>(
        'helpTextStyle', helpTextStyle,
        defaultValue: null));
    properties.add(
        DiagnosticsProperty<ShapeBorder>('shape', shape, defaultValue: null));
    properties.add(DiagnosticsProperty<ShapeBorder>(
        'dayPeriodShape', dayPeriodShape,
        defaultValue: null));
    properties.add(DiagnosticsProperty<BorderSide>(
        'dayPeriodBorderSide', dayPeriodBorderSide,
        defaultValue: null));
    properties.add(DiagnosticsProperty<ZeroTextfieldStyle>(
        'textfieldStyle', textfieldStyle,
        defaultValue: null));
  }
}

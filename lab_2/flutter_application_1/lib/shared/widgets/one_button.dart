import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/one_button_style.dart';
import 'package:flutter_application_1/core/resourses/app_color.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';

class OneButton extends StatelessWidget {
  const OneButton({
    super.key,
    required this.text,
    this.onTap,
    this.isEnabled = true,
    this.color,
    this.textStyle,
    this.height,
    this.borderRadius,
    this.width,
    this.padding,
    this.iconColor,
    this.icon,
    this.secondaryIcon,
    this.iconSize,
    this.disabledColor,
    this.disabledIconColor,
    this.buttonStyle = OneButtonStyle.filled,
  });
  final Function()? onTap;
  final String text;
  final TextStyle? textStyle;
  final EdgeInsets? padding;
  final bool isEnabled;
  final Color? color;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;
  final Color? iconColor;
  final Widget? icon;
  final Widget? secondaryIcon;
  final double? iconSize;
  final Color? disabledColor;
  final Color? disabledIconColor;
  final OneButtonStyle buttonStyle;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      width: width,
      height: height ?? 52,
      child: buttonStyle == OneButtonStyle.outlined
          ? OutlinedButton(
              onPressed: isEnabled ? onTap : null,
              style: ButtonStyle(
                mouseCursor: MaterialStateProperty.all(isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic),
                padding: MaterialStateProperty.all(
                  padding ?? const EdgeInsets.symmetric(horizontal: PaddingConstants.large, vertical: 0),
                ),
                backgroundColor: MaterialStateProperty.all(_getColor(context)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(BorderRadiusConstants.extraLarge),
                    side: BorderSide(color: color ?? theme.colorScheme.onPrimary),
                  ),
                ),
                side: MaterialStateProperty.all<BorderSide>(BorderSide(color: color ?? theme.colorScheme.onPrimary)),
              ),
              child: _buildBody(context),
            )
          : ElevatedButton(
              onPressed: isEnabled ? onTap : null,
              style: ButtonStyle(
                mouseCursor: MaterialStateProperty.all(isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic),
                padding: MaterialStateProperty.all(
                  padding ?? const EdgeInsets.symmetric(horizontal: PaddingConstants.large, vertical: 0),
                ),
                backgroundColor: MaterialStateProperty.all(_getColor(context)),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: borderRadius ?? BorderRadius.circular(BorderRadiusConstants.extraLarge),
                  ),
                ),
              ),
              child: _buildBody(context),
            ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (icon != null)
          Row(
            children: [
              icon!,
              if (text.isNotEmpty) const SizedBox(width: PaddingConstants.medium),
            ],
          ),
        if (text.isNotEmpty)
          Flexible(
            child: Text(
              text,
              style: textStyle ??
                  theme.textTheme.bodySmall?.copyWith(
                    color: isEnabled ? theme.colorScheme.onPrimary : theme.colorScheme.onPrimary.withOpacity(0.75),
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        if (secondaryIcon != null)
          Row(
            children: [
              if (text.isNotEmpty) const SizedBox(width: PaddingConstants.medium),
              secondaryIcon!,
            ],
          ),
      ],
    );
  }

  Color? _getColor(BuildContext context) {
    final theme = Theme.of(context);
    if (buttonStyle == OneButtonStyle.filled) {
      if (isEnabled) {
        return color ?? AppColor.mainPurple;
      } else {
        return disabledColor ?? (color?.withOpacity(0.7) ?? AppColor.mainPurple.withOpacity(0.7));
      }
    } else {
      return Colors.transparent;
    }
  }
}

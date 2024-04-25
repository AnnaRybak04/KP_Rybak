import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/enum/one_button_style.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';

class OneButton extends StatefulWidget {
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
  State<OneButton> createState() => _OneButtonState();
}

class _OneButtonState extends State<OneButton> with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animationTweenElevation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 50),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    animationTweenElevation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeInOut,
    ).drive(Tween(begin: 0, end: 3));
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return MouseRegion(
      onEnter: (_) {
        animationController.forward();
      },
      onExit: (_) {
        animationController.reverse();
      },
      child: SizedBox(
        width: widget.width,
        height: widget.height ?? 52,
        child: widget.buttonStyle == OneButtonStyle.outlined
            ? OutlinedButton(
                onPressed: widget.isEnabled ? widget.onTap : null,
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(animationTweenElevation.value),
                  mouseCursor: MaterialStateProperty.all(
                    widget.isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
                  ),
                  padding: MaterialStateProperty.all(
                    widget.padding ?? const EdgeInsets.symmetric(horizontal: PaddingConstants.large, vertical: 0),
                  ),
                  backgroundColor: MaterialStateProperty.all(_getColor(context)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: widget.borderRadius ?? BorderRadius.circular(BorderRadiusConstants.extraLarge),
                      side: BorderSide(color: widget.color ?? theme.colorScheme.onPrimary),
                    ),
                  ),
                  side: MaterialStateProperty.all<BorderSide>(
                    BorderSide(color: widget.color ?? theme.colorScheme.onPrimary),
                  ),
                ),
                child: _buildBody(context),
              )
            : ElevatedButton(
                onPressed: widget.isEnabled ? widget.onTap : null,
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all(animationTweenElevation.value),
                  mouseCursor: MaterialStateProperty.all(
                    widget.isEnabled ? SystemMouseCursors.click : SystemMouseCursors.basic,
                  ),
                  padding: MaterialStateProperty.all(
                    widget.padding ?? const EdgeInsets.symmetric(horizontal: PaddingConstants.large, vertical: 0),
                  ),
                  backgroundColor: MaterialStateProperty.all(_getColor(context)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: widget.borderRadius ?? BorderRadius.circular(BorderRadiusConstants.extraLarge),
                    ),
                  ),
                ),
                child: _buildBody(context),
              ),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.icon != null)
          Row(
            children: [
              widget.icon!,
              if (widget.text.isNotEmpty) const SizedBox(width: PaddingConstants.medium),
            ],
          ),
        if (widget.text.isNotEmpty)
          Flexible(
            child: Text(
              widget.text,
              style: widget.textStyle ??
                  theme.textTheme.bodySmall?.copyWith(
                    color:
                        widget.isEnabled ? theme.colorScheme.onPrimary : theme.colorScheme.onPrimary.withOpacity(0.75),
                  ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        if (widget.secondaryIcon != null)
          Row(
            children: [
              if (widget.text.isNotEmpty) const SizedBox(width: PaddingConstants.medium),
              widget.secondaryIcon!,
            ],
          ),
      ],
    );
  }

  Color? _getColor(BuildContext context) {
    final theme = Theme.of(context);
    if (widget.buttonStyle == OneButtonStyle.filled) {
      if (widget.isEnabled) {
        return widget.color ?? theme.colorScheme.primary;
      } else {
        return widget.disabledColor ?? (widget.color?.withOpacity(0.7) ?? theme.primaryColor.withOpacity(0.7));
      }
    } else {
      return Colors.transparent;
    }
  }
}

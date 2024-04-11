// ignore_for_file: invalid_use_of_protected_member, avoid_positional_boolean_parameters

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/core/resourses/dimension_constants.dart';
import 'package:flutter_application_1/shared/widgets/one_scroll_behevior.dart';

typedef ValidationChecker = String? Function(String?);
typedef TypingChecker = bool Function();

class OneTextField extends StatefulWidget {
  const OneTextField({
    super.key,
    required this.controller,
    this.focusNode,
    this.inputFormatters,
    this.labelText,
    this.note,
    this.autoFocus = false,
    this.obscureText = false,
    this.canShowHidePassword = false,
    this.isOptional = false,
    this.keyboardType = TextInputType.multiline,
    this.isDisabled = false,
    this.textInputAction = TextInputAction.done,
    this.autoFillHints,
    this.maxLength,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmit,
    this.hasSaveButton = false,
    this.onFocusChanged,
    this.onEditCallback,
    this.onSaveCallback,
    this.readOnly = false,
    this.containerPadding,
    this.cursorColor,
    this.borderRadius,
    this.icon,
    this.secondaryIconPath,
    this.errorMargin,
    this.noteMargin,
    this.saveEditButtonTextStyle,
    this.optionalButtonTextStyle,
    this.containerDecoration,
    this.textFieldDecoration,
    this.onValidate,
    this.textStyle,
    this.centerInput = false,
    this.minLines,
    this.maxLines,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.alignLabelByStart = false,
    this.backgroundColor,
    this.optionalSuffix,
    this.optionalPrefix,
    this.mouseCursor,
    this.focusedBorderSide,
    this.hoverColor,
    this.isCollapsed,
    this.onTap,
  });
  final TextEditingController controller;
  final FocusNode? focusNode;
  final String? labelText;
  final List<TextInputFormatter>? inputFormatters;
  final bool obscureText;
  final bool canShowHidePassword;
  final String? note;
  final bool isOptional;
  final bool hasSaveButton;
  final TextInputType keyboardType;
  final bool autoFocus;
  final bool isDisabled;
  final TextInputAction textInputAction;
  final List<String>? autoFillHints;
  final int? maxLength;
  final Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  final VoidCallback? onSubmit;
  final Function(bool value)? onFocusChanged;
  final VoidCallback? onEditCallback;
  final VoidCallback? onSaveCallback;
  final int? maxLines;
  final int? minLines;
  final bool readOnly;
  final EdgeInsets? containerPadding;
  final Color? cursorColor;
  final BorderRadius? borderRadius;
  final IconData? icon;
  final String? secondaryIconPath;
  final EdgeInsets? errorMargin;
  final EdgeInsets? noteMargin;
  final TextStyle? saveEditButtonTextStyle;
  final TextStyle? optionalButtonTextStyle;
  final BoxDecoration? containerDecoration;
  final InputDecoration? textFieldDecoration;
  final ValidationChecker? onValidate;
  final TextStyle? textStyle;
  final bool centerInput;
  final bool alignLabelByStart;
  final AutovalidateMode autovalidateMode;
  final Widget Function(bool hasFocus)? optionalSuffix;
  final Widget Function(bool hasFocus)? optionalPrefix;
  final Color? backgroundColor;
  final MouseCursor? mouseCursor;
  final BorderSide? focusedBorderSide;
  final Color? hoverColor;
  final bool? isCollapsed;
  final Function()? onTap;

  @override
  State createState() => _OneTextFieldState();
}

class _OneTextFieldState extends State<OneTextField> {
  late final theme = Theme.of(context);
  bool _obscureText = false;
  bool _hasFocus = false;

  @override
  void initState() {
    super.initState();
    _obscureText = widget.obscureText;
    widget.focusNode?.addListener(() {
      Future<void>.delayed(const Duration(milliseconds: 250), () {
        widget.onFocusChanged?.call(widget.focusNode?.hasFocus ?? false);
      });
    });
  }

  void _requestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(widget.focusNode);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: OneScrollBehavior(),
      child: Focus(
        onFocusChange: (value) {
          widget.onFocusChanged?.call(value);
          setState(() {
            _hasFocus = value;
          });
        },
        child: _buildBody(),
      ),
    );
  }

  Widget _buildBody() {
    return TextFormField(
      textAlign: widget.centerInput ? TextAlign.center : TextAlign.start,
      maxLines: widget.maxLines ?? 1,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      focusNode: widget.focusNode,
      enableSuggestions: widget.autoFillHints != null,
      autofocus: widget.autoFocus,
      autocorrect: widget.autoFillHints != null,
      autofillHints: widget.autoFillHints,
      keyboardType: widget.keyboardType,
      obscureText: _obscureText,
      textInputAction: widget.textInputAction,
      cursorColor: widget.cursorColor ?? theme.colorScheme.surfaceVariant,
      expands: false,
      style: widget.textStyle?.copyWith(color: Colors.black) ??
          theme.primaryTextTheme.bodyLarge?.copyWith(color: Colors.black),
      onTap: () {
        _requestFocus();
        widget.onTap?.call();
      },
      validator: (value) {
        return widget.onValidate?.call(value);
      },
      onChanged: (String text) {
        setState(() {
          widget.onChanged?.call(text);
        });
      },
      enabled: !widget.isDisabled,
      mouseCursor: widget.mouseCursor,
      autovalidateMode: widget.autovalidateMode,
      onEditingComplete: widget.onEditingComplete,
      onFieldSubmitted: (_) => widget.onSubmit?.call(),
      decoration: widget.textFieldDecoration ??
          InputDecoration(
            isCollapsed: widget.isCollapsed ?? false,
            hoverColor: widget.hoverColor,
            border: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(BorderRadiusConstants.large),
              borderSide: BorderSide(color: theme.colorScheme.surfaceVariant),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(BorderRadiusConstants.large),
              borderSide: widget.focusedBorderSide ?? BorderSide(color: theme.colorScheme.onPrimary),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(BorderRadiusConstants.large),
              borderSide: BorderSide(color: theme.colorScheme.surfaceVariant),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(BorderRadiusConstants.large),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(BorderRadiusConstants.large),
              borderSide: BorderSide(color: theme.colorScheme.error),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: widget.borderRadius ?? BorderRadius.circular(BorderRadiusConstants.large),
              borderSide: BorderSide(color: theme.colorScheme.surfaceVariant),
            ),
            prefix: _buildPrefix(),
            prefixIcon: _buildPrefixIcon(),
            filled: true,
            fillColor: widget.backgroundColor ?? theme.colorScheme.surface,
            errorStyle: widget.textStyle?.copyWith(color: theme.colorScheme.error) ??
                theme.primaryTextTheme.bodyLarge?.copyWith(color: theme.colorScheme.error),
            hintStyle: widget.textStyle?.copyWith(color: theme.colorScheme.surfaceTint) ??
                theme.primaryTextTheme.bodyLarge?.copyWith(color: theme.colorScheme.surfaceTint),
            hintText: widget.labelText,
            alignLabelWithHint: widget.maxLines != null,
            counterText: '',
            contentPadding: widget.containerPadding ??
                const EdgeInsets.symmetric(
                  horizontal: PaddingConstants.medium,
                  vertical: PaddingConstants.normal,
                ),
          ),
    );
  }

  Widget? _buildPrefixIcon() {
    if (widget.icon != null) {
      return Padding(
        padding: const EdgeInsets.all(PaddingConstants.medium),
        child: Icon(
          widget.icon,
          color: theme.colorScheme.onPrimary,
          size: DimensionConstants.iconLarge,
        ),
      );
    }
    return null;
  }

  Widget? _buildPrefix() {
    if (widget.optionalPrefix != null) {
      return widget.optionalPrefix!(_hasFocus);
    }
    return null;
  }
}

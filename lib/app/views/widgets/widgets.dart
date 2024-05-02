import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../const/theme.dart';

class APaddedIcon extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final Color? iconColor;
  final double? padding;
  final double? radius;
  final double? iconSize;
  final bool shadow;

  const APaddedIcon(
    this.icon, {
    Key? key,
    this.color,
    this.iconColor,
    this.padding,
    this.radius,
    this.iconSize,
    this.shadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      padding: EdgeInsets.all(padding ?? 10),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        borderRadius: BorderRadius.circular(radius ?? 15),
        boxShadow: shadow ? appShadow : null,
      ),
      child: Icon(
        icon,
        color: iconColor ?? (color != null ? Colors.white : Colors.black),
        size: iconSize,
      ),
    );
  }
}

class ASimCard extends StatelessWidget {
  final String name;
  final Color? iconColor;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final IconData? icon;
  final bool shadow;
  final EdgeInsets? margin;

  const ASimCard(
    this.name, {
    this.icon,
    this.iconColor,
    this.margin,
    Key? key,
    this.onTap,
    this.backgroundColor,
    this.shadow = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          decoration: BoxDecoration(
            color: backgroundColor ?? Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: shadow ? appShadow : null,
          ),
          padding: const EdgeInsets.all(20),
          margin: margin,
          child: Column(
            children: [
              if (icon != null) APaddedIcon(icon!, color: iconColor),
              if (icon != null)
                const SizedBox(
                  height: 10,
                ),
              Text(
                name,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.blueGrey[900],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AListTile extends StatelessWidget {
  final Color color;
  final String title;
  final String subtitle;
  final bool? expanded;

  const AListTile(this.title, this.subtitle, this.color,
      {Key? key, this.expanded = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Row(
      children: [
        AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[900],
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey[900],
              ),
            ),
          ],
        ),
      ],
    );
    if (expanded == true) {
      return Expanded(child: child);
    }
    return child;
  }
}

class ASectionTitle extends StatelessWidget {
  final String title;
  final TextAlign? textAlign;
  final double? paddingTop;
  final double? paddingBottom;
  final TextStyle? textStyle;
  const ASectionTitle(
    this.title, {
    Key? key,
    this.textStyle,
    this.textAlign,
    this.paddingTop,
    this.paddingBottom,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.fromLTRB(20, paddingTop ?? 0, 20, paddingBottom ?? 10),
      child: Text(
        title,
        textAlign: textAlign,
        style: textStyle ?? appTextStyle(),
      ),
    );
  }
}

class AOperationButton extends StatelessWidget {
  final String name;
  final VoidCallback? onTap;
  final Color? iconColor;
  final Color? backgroundColor;

  const AOperationButton(
    this.name, {
    Key? key,
    this.onTap,
    this.iconColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: backgroundColor ?? Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: appShadow,
        ),
        child: AListTile(
          "Opération",
          name,
          iconColor ?? Colors.blue,
          expanded: false,
        ),
      ),
    );
  }
}

class AInputField extends StatelessWidget {
  final Color? backgroundColor;
  final Color? textColor;
  final FocusNode? focusNode;
  final String? hintText;
  final TextStyle? hintStyle;
  final TextStyle? textStyle;
  final Widget? prefixIcon;
  final String? prefix;
  final String? suffix;
  final int? maxLength;
  final double? borderRadius;
  final bool boxShadow;
  final bool readOnly;
  final bool? obscureText;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final TextInputType? keyboardType;
  final TextAlign? textAlign;
  final TextDirection? hintTextDirection;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;

  const AInputField({
    Key? key,
    this.controller,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.maxLength,
    this.borderRadius = 10,
    this.margin,
    this.padding,
    this.prefixIcon,
    this.prefix,
    this.textColor,
    this.boxShadow = true,
    this.readOnly = false,
    this.obscureText = false,
    this.suffix,
    this.onChanged,
    this.hintTextDirection,
    this.onSubmitted,
    this.keyboardType,
    this.textAlign,
    this.backgroundColor = Colors.white,
    this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      margin: margin ?? const EdgeInsets.fromLTRB(20, 0, 20, 20),
      padding:
          padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(borderRadius ?? 10),
        boxShadow: boxShadow ? appShadow : null,
      ),
      child: TextField(
        controller: controller,
        readOnly: readOnly,
        focusNode: focusNode,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        obscureText: obscureText ?? false,
        obscuringCharacter: '*',
        // maxLength: maxLength,
        textAlign: textAlign ?? TextAlign.start,
        keyboardType: keyboardType ?? TextInputType.phone,
        style: textStyle ??
            TextStyle(
              color: textColor,
              fontSize: 24,
              fontWeight: FontWeight.w400,
            ),
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          prefix: prefix != null
              ? Text(
                  prefix!,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                )
              : null,
          suffix: suffix != null
              ? Text(
                  suffix!,
                  style: TextStyle(
                    color: textColor,
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                  ),
                )
              : null,
          hintText: hintText,
          hintStyle: hintStyle,
          hintTextDirection: hintTextDirection,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class AContainer extends StatelessWidget {
  final Widget? child;
  final double? height;
  final int flex;
  final double? width;
  final double? borderRadius;
  final Color backgroundColor;
  final Gradient? gradient;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final VoidCallback? onTap;
  final bool? expanded;
  final bool hasShadow;

  const AContainer({
    Key? key,
    this.child,
    this.onTap,
    this.gradient,
    this.height,
    this.flex = 1,
    this.width,
    this.borderRadius,
    this.backgroundColor = Colors.white,
    this.padding,
    this.margin,
    this.expanded = false,
    this.hasShadow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget widget = InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        height: height,
        width: width,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        margin: margin ?? const EdgeInsets.fromLTRB(20, 0, 20, 20),
        padding:
            padding ?? const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: backgroundColor,
          gradient: gradient,
          borderRadius: BorderRadius.circular(borderRadius ?? 5),
          boxShadow: hasShadow ? appShadow : null,
        ),
        child: child,
      ),
    );

    if (expanded == true) return Expanded(flex: flex, child: widget);
    return widget;
  }
}

import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? backgroundColor;
  final BorderRadiusGeometry borderRadius;
  final BoxBorder? border;
  final Gradient? gradient;

  const CardWidget({
    super.key,
    this.child,
    this.padding,
    this.margin,
    this.backgroundColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(12)),
    this.border,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? EdgeInsets.zero,
      decoration: BoxDecoration(
        color: gradient == null ? backgroundColor : null,
        gradient: gradient,
        borderRadius: borderRadius,
        border: border,
      ),
      child: child,
    );
  }
}

class CardHeader extends StatelessWidget {
  final Widget? title;
  final Widget? action;
  final EdgeInsetsGeometry padding;

  const CardHeader({
    super.key,
    this.title,
    this.action,
    this.padding = const EdgeInsets.fromLTRB(16, 16, 16, 8),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [if (title != null) title!, if (action != null) action!],
      ),
    );
  }
}

class CardTitle extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CardTitle({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          style ??
          Theme.of(
            context,
          ).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}

class CardDescription extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CardDescription({super.key, required this.text, this.style});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          style ??
          Theme.of(
            context,
          ).textTheme.bodyMedium?.copyWith(color: Colors.grey[600]),
    );
  }
}

class CardContent extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const CardContent({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}

class CardFooter extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const CardFooter({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 8, 16, 16),
  });

  @override
  Widget build(BuildContext context) {
    return Padding(padding: padding, child: child);
  }
}

import 'package:flutter/material.dart';

class NavBarButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final Color? activeColor;
  final Color? textColor;
  final Color? activeTextColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final bool isActive;

  const NavBarButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.activeColor,
    this.textColor,
    this.activeTextColor,
    this.width,
    this.height,
    this.borderRadius = 8.0,
    this.padding,
    this.isActive = false,
  });

  @override
  State<NavBarButton> createState() => _NavBarButtonState();
}

class _NavBarButtonState extends State<NavBarButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color defaultActiveColor = Theme.of(context).scaffoldBackgroundColor;

    // Determine background color based on active state and hover
    final Color backgroundColor = widget.isActive
        ? (widget.activeColor ?? defaultActiveColor)
        : (_isHovered
            ? (widget.backgroundColor?.withOpacity(0.8) ??
                Theme.of(context).hoverColor)
            : (widget.backgroundColor ??
                Theme.of(context).scaffoldBackgroundColor));

    // Create a wrapped child to apply text color
    final Widget styledChild = DefaultTextStyle(
      style: DefaultTextStyle.of(context).style.copyWith(
            color: widget.isActive
                ? (widget.activeTextColor ?? Colors.white)
                : (widget.textColor ??
                    Theme.of(context).textTheme.bodyLarge?.color),
            // if active, style underline with white color
            decoration: widget.isActive
                ? TextDecoration.underline
                : TextDecoration.none,
            // make underline big
            decorationThickness: 3,
          ),
      child: widget.child,
    );

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Container(
        width: widget.width,
        height: widget.height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius),
        ),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onPressed,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            hoverColor: widget.isActive
                ? Colors.transparent
                : Theme.of(context).hoverColor,
            splashColor: widget.isActive
                ? Colors.transparent
                : Theme.of(context).splashColor,
            child: Container(
              padding: widget.padding ?? const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
                // Optional: Add a border or bottom indicator for active state
                border: widget.isActive
                    ? Border(
                        bottom: BorderSide(
                          color: widget.activeColor ?? defaultActiveColor,
                          width: 2.0,
                        ),
                      )
                    : null,
              ),
              child: styledChild,
            ),
          ),
        ),
      ),
    );
  }
}

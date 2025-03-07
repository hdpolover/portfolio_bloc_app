import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final VoidCallback? onPressed;
  final Widget child;
  final Color? backgroundColor;
  final double? width;
  final double? height;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;

  const CustomButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor,
    this.width,
    this.height,
    this.borderRadius = 8.0,
    this.padding,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
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
            hoverColor: Theme.of(context).hoverColor,
            splashColor: Theme.of(context).splashColor,
            child: Container(
              padding: widget.padding ?? const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: _isHovered
                    ? (widget.backgroundColor ?? Theme.of(context).primaryColor)
                    : widget.backgroundColor ??
                        Theme.of(context).scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(widget.borderRadius),
              ),
              child: widget.child,
            ),
          ),
        ),
      ),
    );
  }
}

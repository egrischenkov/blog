import 'package:blog/core/common/extensions/build_context_extension.dart';
import 'package:flutter/material.dart';

/// Tab item on tab bar.
class TabItem extends StatefulWidget {
  /// @nodoc
  final String title;

  /// @nodoc
  final VoidCallback onTap;

  /// @nodoc
  const TabItem({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  State<TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> with SingleTickerProviderStateMixin {
  late final Animation<double> animation;
  late final AnimationController animationController;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });

    animation = Tween<double>(
      begin: 0,
      end: 32,
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorTheme = context.colorsTheme;
    final tabStyle = textTheme.bold14.copyWith(color: colorTheme.onBackground);

    return Stack(
      children: [
        Container(
          height: animation.value,
          width: 2,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: colorTheme.primary,
          ),
        ),
        const SizedBox(height: 16),
        MouseRegion(
          onHover: (_) {
            animationController.forward();
          },
          onExit: (_) {
            animationController.reverse();
          },
          child: TextButton(
            onPressed: widget.onTap,
            child: Text(widget.title, style: tabStyle),
          ),
        ),
      ],
    );
  }
}

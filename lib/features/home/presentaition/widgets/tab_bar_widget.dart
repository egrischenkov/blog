import 'package:blog/core/common/extensions/build_context_x.dart';
import 'package:flutter/material.dart';

/// Tab bar.
///
/// Manages app navigation.
class TabBarWidget extends StatelessWidget {
  /// @nodoc
  const TabBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final textTheme = context.textTheme;
    final colorTheme = context.colorTheme;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Text(
              l10n.homeTitle,
              style: textTheme.bold24.copyWith(color: colorTheme.onBackground),
            ),
          ),
          const SizedBox(width: 16),
          Row(
            children: [
              _TabItem(
                onTap: () {},
                title: l10n.homeTabTitle,
              ),
              const SizedBox(width: 16),
              _TabItem(
                onTap: () {},
                title: l10n.aboutTabTitle,
              ),
              const SizedBox(width: 16),
              _TabItem(
                onTap: () {},
                title: l10n.contentTabTitle,
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.settings,
                  color: colorTheme.inactive,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TabItem extends StatefulWidget {
  final String title;
  final VoidCallback onTap;

  const _TabItem({required this.title, required this.onTap});

  @override
  State<_TabItem> createState() => _TabItemState();
}

class _TabItemState extends State<_TabItem> with SingleTickerProviderStateMixin {
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
    final colorTheme = context.colorTheme;
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

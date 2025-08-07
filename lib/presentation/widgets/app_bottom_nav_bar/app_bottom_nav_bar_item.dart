import 'package:flutter/material.dart';

class AppBottomNavBarItem extends StatelessWidget {
  const AppBottomNavBarItem({
    super.key,
    required this.onNavigate,
    required this.icon,
    this.index,
    this.currentIndex,
    this.onChangeIndex,
  });

  final VoidCallback onNavigate;
  final Widget icon;
  final int? index;
  final int? currentIndex;
  final void Function(int index)? onChangeIndex;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return (index != null && currentIndex != null && onChangeIndex != null)
        ? IconButton(
            onPressed: () {
              onNavigate();
              onChangeIndex!(index!);
            },
            icon: icon,
            style: IconButton.styleFrom(
              backgroundColor: index == currentIndex
                  ? theme.colorScheme.primaryContainer
                  : null,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(22),
              ),
              fixedSize: const Size(57, 53),
            ),
          )
        : const Placeholder();
  }

  AppBottomNavBarItem copyWith({
    VoidCallback? onNavigate,
    Widget? icon,
    Color? backgroundColor,
    int? index,
    int? currentIndex,
    void Function(int index)? onChangeIndex,
  }) {
    return AppBottomNavBarItem(
      onNavigate: onNavigate ?? this.onNavigate,
      icon: icon ?? this.icon,
      index: index,
      currentIndex: currentIndex,
      onChangeIndex: onChangeIndex,
    );
  }
}

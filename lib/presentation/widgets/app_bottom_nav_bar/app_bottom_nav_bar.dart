import 'package:flutter/material.dart';
import 'package:websocket_example/presentation/widgets/app_bottom_nav_bar/app_bottom_nav_bar_item.dart';

class AppBottomNavBar extends StatefulWidget {
  const AppBottomNavBar({
    super.key,
    required this.items,
    this.backgroundColor,
    this.currentIndex = 3,
    this.selectedItemColor,
    this.unselectedItemColor,
  });

  final List<AppBottomNavBarItem> items;
  final Color? backgroundColor;
  final int currentIndex;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;

  @override
  State<AppBottomNavBar> createState() => _AppBottomNavBarState();
}

class _AppBottomNavBarState extends State<AppBottomNavBar> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  void _onChangeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final theme = Theme.of(context);

    return Container(
      height: 108,
      width: mediaQuery.size.width,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(70),
          topRight: Radius.circular(70),
        ),
        color: widget.backgroundColor ?? theme.colorScheme.secondaryContainer,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            for (int i = 0; i < widget.items.length; i++)
              widget.items[i].copyWith(
                index: i + 1,
                currentIndex: currentIndex,
                onChangeIndex: _onChangeIndex,
              ),
          ],
        ),
      ),
    );
  }
}

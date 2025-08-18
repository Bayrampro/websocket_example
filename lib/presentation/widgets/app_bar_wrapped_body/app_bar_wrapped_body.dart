import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';

class AppBarWrappedBody extends StatelessWidget {
  const AppBarWrappedBody({
    super.key,
    required this.body,
    this.onPressed,
    required this.title,
    required this.headerWidget,
    this.headerExpandedHeight = 0.3,
  });

  final List<Widget> body;
  final VoidCallback? onPressed;
  final String title;
  final Widget headerWidget;
  final double headerExpandedHeight;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return DraggableHome(
      appBarColor: theme.colorScheme.primaryContainer,
      alwaysShowTitle: true,
      headerExpandedHeight: headerExpandedHeight,
      curvedBodyRadius: 50,
      alwaysShowLeadingAndAction: true,
      physics: const ClampingScrollPhysics(),
      leading: onPressed != null
          ? IconButton(
              onPressed: onPressed,
              icon: Icon(Icons.arrow_back, size: 32, color: theme.canvasColor),
            )
          : null,
      title: Text(title, style: theme.textTheme.titleLarge),
      headerWidget: headerWidget,
      body: body,
    );
  }
}

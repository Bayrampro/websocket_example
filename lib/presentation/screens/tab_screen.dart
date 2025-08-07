import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:websocket_example/config/router/router.dart';
import 'package:websocket_example/core/constants/assets.dart';
import 'package:websocket_example/presentation/widgets/app_bottom_nav_bar/export.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          child,
          Align(
            alignment: Alignment.bottomCenter,
            child: AppBottomNavBar(
              currentIndex: AppRouter.getCurrentIndex(context),
              items: [
                AppBottomNavBarItem(
                  onNavigate: () => AppRouter.onTabTapped(0, context),
                  icon: SvgPicture.asset(Assets.homeIcon),
                ),
                AppBottomNavBarItem(
                  onNavigate: () => AppRouter.onTabTapped(1, context),
                  icon: SvgPicture.asset(Assets.analysisIcon),
                ),
                AppBottomNavBarItem(
                  onNavigate: () => AppRouter.onTabTapped(2, context),
                  icon: SvgPicture.asset(Assets.transactionsIcon),
                ),
                AppBottomNavBarItem(
                  onNavigate: () => AppRouter.onTabTapped(3, context),
                  icon: SvgPicture.asset(Assets.categoryIcon),
                ),
                AppBottomNavBarItem(
                  onNavigate: () => AppRouter.onTabTapped(4, context),
                  icon: SvgPicture.asset(Assets.profileIcon),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

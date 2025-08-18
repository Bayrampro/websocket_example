import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:talker_flutter/talker_flutter.dart';
import 'package:websocket_example/core/di/service_locator.dart';
import 'package:websocket_example/presentation/screens/tab_screen.dart';
import 'package:websocket_example/presentation/screens/ticker_screen.dart';
import 'package:websocket_example/presentation/screens/trades_screen.dart';

class AppRouter {
  static final router = GoRouter(
    observers: [TalkerRouteObserver(getIt.get<Talker>())],
    initialLocation: Routes.home,
    routes: [
      ShellRoute(
        builder: (context, state, child) => TabScreen(child: child),
        routes: [
          GoRoute(
            path: Routes.home,
            builder: (context, state) => const TickerScreen(),
          ),
          GoRoute(
            path: Routes.trades,
            builder: (context, state) => const TradesScreen(),
          ),
        ],
      ),
    ],
  );

  static int getCurrentIndex(BuildContext context) {
    final GoRouterState state = GoRouterState.of(context);

    switch (state.fullPath) {
      case Routes.home:
        return 1;
      case Routes.analysis:
        return 2;
      case Routes.trades:
        return 3;
      case Routes.category:
        return 4;
      case Routes.profile:
        return 5;
      default:
        return 3;
    }
  }

  static void onTabTapped(int index, BuildContext context) {
    switch (index) {
      case 0:
        context.go(Routes.home);
        break;
      case 1:
        context.go(Routes.analysis);
        break;
      case 2:
        context.go(Routes.trades);
      case 3:
        context.go(Routes.category);
      case 4:
        context.go(Routes.profile);
        break;
    }
  }
}

class Routes {
  static const String home = '/home';
  static const String analysis = '/analysis';
  static const String trades = '/trades';
  static const String category = '/category';
  static const String profile = '/profile';
}

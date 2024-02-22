import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_ui_showcase_test/feature/home/view/home_view.dart';
import '../../feature/cart/view/cart_view.dart';
import '../../feature/home/view/widget/main_wrapper.dart';

class AppNavigation {
  AppNavigation._();

  static const String homePath = '/';
  static const String favoritePath = '/favorite';
  static const String notificationPath = '/notification';
  static const String nerMePath = '/nerMe';
  static const String settingsPath = '/settings';
  static const String cartPath = '/cart';

  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorHome = GlobalKey<NavigatorState>(debugLabel: 'shellHome');
  static final _shellNavigatorFavorite = GlobalKey<NavigatorState>(debugLabel: 'shellFavorite');
  static final _shellNavigatorNotification = GlobalKey<NavigatorState>(debugLabel: 'shellNotification');
  static final _shellNavigatorNerMe = GlobalKey<NavigatorState>(debugLabel: 'shellNerMe');
  static final _shellNavigatorSettings = GlobalKey<NavigatorState>(debugLabel: 'shellSettings');

  static final GoRouter router = GoRouter(
    initialLocation: homePath,
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return MainWrapper(
            navigationShell: navigationShell,
          );
        },
        branches: <StatefulShellBranch>[

          StatefulShellBranch(
            navigatorKey: _shellNavigatorHome,
            routes: <RouteBase>[
              GoRoute(
                path: homePath,
                name: "Home",
                builder: (BuildContext context, GoRouterState state) => HomeView(),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorFavorite,
            routes: <RouteBase>[
              GoRoute(
                path: favoritePath,
                name: "favorite",
                builder: (BuildContext context, GoRouterState state) =>
                const Center(child: Text(favoritePath),),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorNotification,
            routes: <RouteBase>[
              GoRoute(
                path: notificationPath,
                name: "notification",
                builder: (BuildContext context, GoRouterState state) =>
                const Center(child: Text(notificationPath),),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorNerMe,
            routes: <RouteBase>[
              GoRoute(
                path: nerMePath,
                name: "nerMe",
                builder: (BuildContext context, GoRouterState state) =>
                const Center(child: Text(nerMePath),),
              ),
            ],
          ),

          StatefulShellBranch(
            navigatorKey: _shellNavigatorSettings,
            routes: <RouteBase>[
              GoRoute(
                path: settingsPath,
                name: "settings",
                builder: (BuildContext context, GoRouterState state) =>
                const Center(child: Text(settingsPath),),
              ),
            ],
          ),

        ],
      ),
      GoRoute(
        parentNavigatorKey: _rootNavigatorKey,
        path: cartPath,
        name: "cart",
        builder: (context, state) => CartView(
          key: state.pageKey,
        ),
      ),
    ],
  );
}


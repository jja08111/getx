import 'package:flutter/widgets.dart';
import '../routes/default_route.dart';
import '../routes/get_route.dart';

class GetNavigator extends Navigator {
  GetNavigator.onGenerateRoute({
    GlobalKey<NavigatorState>? key,
    bool Function(Route<dynamic>, dynamic)? onPopPage,
    required List<GetPage> pages,
    List<NavigatorObserver>? observers,
    bool reportsRouteUpdateToEngine = false,
    TransitionDelegate? transitionDelegate,
    String? initialRoute,
  }) : super(
          //keys should be optional
          key: key,
          initialRoute: initialRoute,
          onPopPage: onPopPage ??
              (route, result) {
                final didPop = route.didPop(result);
                if (!didPop) {
                  return false;
                }
                return true;
              },
          onGenerateRoute: (settings) {
            final selectedPageList =
                pages.where((element) => element.name == settings.name);
            if (selectedPageList.isNotEmpty) {
              final selectedPage = selectedPageList.first;
              return GetPageRoute(
                page: selectedPage.page,
                settings: settings,
              );
            }
          },
          reportsRouteUpdateToEngine: reportsRouteUpdateToEngine,
          pages: pages,
          observers: [
            // GetObserver(),
            ...?observers,
          ],
          transitionDelegate:
              transitionDelegate ?? const DefaultTransitionDelegate<dynamic>(),
        );

  GetNavigator({
    GlobalKey<NavigatorState>? key,
    bool Function(Route<dynamic>, dynamic)? onPopPage,
    required List<GetPage> pages,
    List<NavigatorObserver>? observers,
    bool reportsRouteUpdateToEngine = false,
    TransitionDelegate? transitionDelegate,
    String? initialRoute,
  }) : super(
          //keys should be optional
          key: key,
          initialRoute: initialRoute,
          onPopPage: onPopPage ??
              (route, result) {
                final didPop = route.didPop(result);
                if (!didPop) {
                  return false;
                }
                return true;
              },
          reportsRouteUpdateToEngine: reportsRouteUpdateToEngine,
          pages: pages,
          observers: [
            // GetObserver(),
            ...?observers,
          ],
          transitionDelegate:
              transitionDelegate ?? const DefaultTransitionDelegate<dynamic>(),
        );
}

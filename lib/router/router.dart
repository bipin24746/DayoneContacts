part of 'app_router.dart';

@AutoRouterConfig(replaceInRouteName: 'page')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => RouteType.adaptive();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(page: SplashScreenRoute.page,path:'/'),
    AutoRoute(page: BlocLoginPageRoute.page),
    AutoRoute(page: OtpPageRoute.page),
    AutoRoute(page: HomeScreenMainRoute.page),
    AutoRoute(page: AllNoticesCleanRoute.page),
    AutoRoute(page: AddVehiclesRoute.page)
  ];
}
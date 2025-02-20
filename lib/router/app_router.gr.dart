// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i9;
import 'package:dayonecontacts/features/invite_guest/widgets/addManuallyRefractored/SplashScreen.dart'
    as _i8;
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/screens/login_page.dart'
    as _i4;
import 'package:dayonecontacts/features/login_pages/clean_code/presentation/screens/otp_page.dart'
    as _i7;
import 'package:dayonecontacts/main_home_screen/pages/home_screen_pages/home_screen.dart'
    as _i6;
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/add_vehicle.dart'
    as _i2;
import 'package:dayonecontacts/main_home_screen/widgets/add_vehicle/vehicle_refractored/add_vehicle.dart'
    as _i1;
import 'package:dayonecontacts/main_home_screen/widgets/all_notices/all_notices_clean_code/presentation/screens/all_notices_clean.dart'
    as _i3;
import 'package:dayonecontacts/main_home_screen/widgets/current_notices/notices_clean_code/presentation/pages/current_notices.dart'
    as _i5;
import 'package:flutter/material.dart' as _i10;

/// generated route for
/// [_i1.AddVehicle]
class AddVehicleRoute extends _i9.PageRouteInfo<void> {
  const AddVehicleRoute({List<_i9.PageRouteInfo>? children})
    : super(AddVehicleRoute.name, initialChildren: children);

  static const String name = 'AddVehicleRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i1.AddVehicle();
    },
  );
}

/// generated route for
/// [_i2.AddVehicles]
class AddVehiclesRoute extends _i9.PageRouteInfo<void> {
  const AddVehiclesRoute({List<_i9.PageRouteInfo>? children})
    : super(AddVehiclesRoute.name, initialChildren: children);

  static const String name = 'AddVehiclesRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i2.AddVehicles();
    },
  );
}

/// generated route for
/// [_i3.AllNoticesClean]
class AllNoticesCleanRoute extends _i9.PageRouteInfo<void> {
  const AllNoticesCleanRoute({List<_i9.PageRouteInfo>? children})
    : super(AllNoticesCleanRoute.name, initialChildren: children);

  static const String name = 'AllNoticesCleanRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i3.AllNoticesClean();
    },
  );
}

/// generated route for
/// [_i4.BlocLoginPage]
class BlocLoginPageRoute extends _i9.PageRouteInfo<void> {
  const BlocLoginPageRoute({List<_i9.PageRouteInfo>? children})
    : super(BlocLoginPageRoute.name, initialChildren: children);

  static const String name = 'BlocLoginPageRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i4.BlocLoginPage();
    },
  );
}

/// generated route for
/// [_i5.CurrentNoticeHome]
class CurrentNoticeHomeRoute extends _i9.PageRouteInfo<void> {
  const CurrentNoticeHomeRoute({List<_i9.PageRouteInfo>? children})
    : super(CurrentNoticeHomeRoute.name, initialChildren: children);

  static const String name = 'CurrentNoticeHomeRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i5.CurrentNoticeHome();
    },
  );
}

/// generated route for
/// [_i6.HomeScreenMain]
class HomeScreenMainRoute extends _i9.PageRouteInfo<void> {
  const HomeScreenMainRoute({List<_i9.PageRouteInfo>? children})
    : super(HomeScreenMainRoute.name, initialChildren: children);

  static const String name = 'HomeScreenMainRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeScreenMain();
    },
  );
}

/// generated route for
/// [_i7.OtpPage]
class OtpPageRoute extends _i9.PageRouteInfo<OtpPageRouteArgs> {
  OtpPageRoute({
    _i10.Key? key,
    required String phoneNo,
    required String hash,
    required String otp,
    List<_i9.PageRouteInfo>? children,
  }) : super(
         OtpPageRoute.name,
         args: OtpPageRouteArgs(
           key: key,
           phoneNo: phoneNo,
           hash: hash,
           otp: otp,
         ),
         initialChildren: children,
       );

  static const String name = 'OtpPageRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OtpPageRouteArgs>();
      return _i7.OtpPage(
        key: args.key,
        phoneNo: args.phoneNo,
        hash: args.hash,
        otp: args.otp,
      );
    },
  );
}

class OtpPageRouteArgs {
  const OtpPageRouteArgs({
    this.key,
    required this.phoneNo,
    required this.hash,
    required this.otp,
  });

  final _i10.Key? key;

  final String phoneNo;

  final String hash;

  final String otp;

  @override
  String toString() {
    return 'OtpPageRouteArgs{key: $key, phoneNo: $phoneNo, hash: $hash, otp: $otp}';
  }
}

/// generated route for
/// [_i8.SplashScreen]
class SplashScreenRoute extends _i9.PageRouteInfo<void> {
  const SplashScreenRoute({List<_i9.PageRouteInfo>? children})
    : super(SplashScreenRoute.name, initialChildren: children);

  static const String name = 'SplashScreenRoute';

  static _i9.PageInfo page = _i9.PageInfo(
    name,
    builder: (data) {
      return _i8.SplashScreen();
    },
  );
}

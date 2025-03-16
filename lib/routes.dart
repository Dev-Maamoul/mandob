import 'package:company_project/layer_data/init_class.dart';
import 'package:company_project/models/driver_model.dart';
import 'package:company_project/screen/checkScreen/check_screen.dart';
import 'package:company_project/screen/driver_view/drivers_view_screen.dart';
import 'package:company_project/screen/drivers/drivers_screen.dart';
import 'package:company_project/screen/edit_profile/edit_profile_screen.dart';
import 'package:company_project/screen/home/home_screen.dart';
import 'package:company_project/screen/login/login_screen.dart';
import 'package:company_project/screen/login/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

final _getIt = GetIt.I.get<InitClass>();

final GoRouter router = GoRouter(
  initialLocation: '/',
  redirect: (BuildContext context, GoRouterState state) async {
    await _getIt.loadData();

    final hasToken = _getIt.authData?.token != null;
    final isTryingToAccessLogin = state.matchedLocation == '/login';
    final isTryingToAccessOtp = state.matchedLocation == '/otp';
    final bool hasStartedLogin = _getIt.loginData?.mobile != null;

    if (!hasToken) {
      if (isTryingToAccessLogin) {
        return null; // Allow access to login
      }
      if (isTryingToAccessOtp && hasStartedLogin) {
        return null; // Allow OTP only if login was started
      }
      return '/login'; // Redirect everyone else to login
    } else {
      if (isTryingToAccessOtp || isTryingToAccessLogin) {
        return '/home'; // Redirect logged-in users to home
      }
      return null; // Stay on the requested page
    }
  },

  routes: <RouteBase>[
    GoRoute(
      name: '/',
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const CheckScreen();
      },
    ),
    GoRoute(
      name: '/login',
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
    ),
    GoRoute(
      name: '/otp',
      path: '/otp',
      builder: (BuildContext context, GoRouterState state) {
        return const OTPScreen();
      },
    ),
    GoRoute(
      name: '/home',
      path: '/home',
      builder: (BuildContext context, GoRouterState state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      name: '/drivers',
      path: '/drivers',
      builder: (BuildContext context, GoRouterState state) {
        return DriversScreen();
      },
    ),
    GoRoute(
      name: '/driver',
      path: '/driver',
      builder: (BuildContext context, GoRouterState state) {
        return DriversViewScreen(driver: state.extra as DriverModel);
      },
    ),
    GoRoute(
      name: '/edit_profile',
      path: '/edit_profile',
      builder: (BuildContext context, GoRouterState state) {
        return EditProfileScreen();
      },
    ),
  ],
  // redirect: (BuildContext context, GoRouterState state) {
  //   // If trying to leave '/home', redirect back to '/home'
  //   if (state.name == '/home' && context.canPop()) {
  //     return '/home'; // Prevents popping from '/home'
  //   }
  //   return null;
  // },
);

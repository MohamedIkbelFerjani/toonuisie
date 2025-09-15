import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// Screens
import 'package:myapp/screens/home_screen.dart';
import 'package:myapp/screens/onboarding_screen.dart';
import 'package:myapp/screens/square_details_screen.dart';
import 'package:myapp/screens/volunteer_list_screen.dart';
import 'package:myapp/screens/cleanup_proof_screen.dart';
import 'package:myapp/screens/leaderboard_screen.dart';
import 'package:myapp/screens/profile_screen.dart';
import 'package:myapp/screens/rewards_screen.dart';
import 'package:myapp/screens/events_screen.dart';
import 'package:myapp/screens/report_cleanup_screen.dart';

void main() {
  runApp(const CleanTunisiaApp());
}

class CleanTunisiaApp extends StatelessWidget {
  const CleanTunisiaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'CleanTunisia',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routerConfig: _router,
    );
  }
}

final GoRouter _router = GoRouter(
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (BuildContext context, GoRouterState state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/square-details/:id',
      builder: (BuildContext context, GoRouterState state) =>
          SquareDetailsScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/volunteer-list/:id',
      builder: (BuildContext context, GoRouterState state) =>
          VolunteerListScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/cleanup-proof/:id',
      builder: (BuildContext context, GoRouterState state) =>
          CleanupProofScreen(id: state.pathParameters['id']!),
    ),
    GoRoute(
      path: '/leaderboard',
      builder: (BuildContext context, GoRouterState state) => const LeaderboardScreen(),
    ),
    GoRoute(
      path: '/profile',
      builder: (BuildContext context, GoRouterState state) => const ProfileScreen(),
    ),
    GoRoute(
      path: '/rewards',
      builder: (BuildContext context, GoRouterState state) => const RewardsScreen(),
    ),
    GoRoute(
      path: '/events',
      builder: (BuildContext context, GoRouterState state) => const EventsScreen(),
    ),
    GoRoute(
      path: '/report-cleanup',
      builder: (BuildContext context, GoRouterState state) => const ReportCleanupScreen(),
    ),
  ],
);

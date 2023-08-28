import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/favorites.dart';
import 'screens/favorites.dart';
import 'screens/home.dart';
import 'package:go_router/go_router.dart';


final _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: HomePage.routeName,
      builder: (context, state) {
        return const HomePage();
      },
      routes: <RouteBase>[
        GoRoute(
          path: FavoritesPage.routeName,
          builder: (context, state) {
            return const FavoritesPage();
          },
        ),
      ],
    ),
  ],
);

void main() {
  runApp(const TestingApp());
}



class TestingApp extends StatelessWidget {
  const TestingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Favorites>(
      create: (context) => Favorites(),
      child: MaterialApp.router(
        title: 'Testing Sample',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        routerConfig: _router,
      ),
    );
  }
}

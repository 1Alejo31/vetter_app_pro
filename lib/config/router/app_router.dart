import 'package:go_router/go_router.dart';
import 'package:vetter_app/src/presentation/screen/home/home_screen.dart';
import 'package:vetter_app/src/presentation/screen/login/login_screen.dart';
import 'package:vetter_app/src/presentation/screen/register/register_screen.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      name: HomeScreen.name,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/login',
      name: LoginScreen.name,
      builder: (context, state) => const LoginScreen(),
    ),
    GoRoute(
      path: '/register',
      name: RegisterScreen.name,
      builder: (context, state) => const RegisterScreen(),
    ),
  ],
);

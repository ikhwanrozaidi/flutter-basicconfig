import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/config/flavor_config.dart';
import 'core/di/injection.dart';
import 'features/auth/presentation/bloc/auth_bloc.dart';
import 'routes/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Configure dependencies must run before anything else
  await configureDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide AuthBloc globally
      create: (context) => getIt<AuthBloc>(),
      child: MaterialApp.router(
        title: FlavorConfig.instance.appTitle,
        debugShowCheckedModeBanner:
            FlavorConfig.instance.debugShowCheckedModeBanner,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
          fontFamily: 'Poppins',
          appBarTheme: const AppBarTheme(centerTitle: true, elevation: 0),
          // cardTheme: CardTheme(
          //   elevation: 2,
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          // ),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}

import 'package:evenemento/core/router/router_generator.dart';
import 'package:evenemento/core/style/style.dart';
import 'package:evenemento/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'core/di/injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  di.init();

  runApp(const EventApp());
}

class EventApp extends StatelessWidget {
  const EventApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.cyanDarkTheme,
      routerConfig: RouteGenerator.goRouter,
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:nom_nom_eats/services/auth/auth_gate.dart';
// import 'package:nom_nom_eats/services/auth/login_or_register.dart';
import 'package:nom_nom_eats/firebase_options.dart';
import 'package:nom_nom_eats/models/restaurant.dart';
import 'package:nom_nom_eats/themes/theme_provider.dart';
import 'package:provider/provider.dart';
// import 'pages/login_page.dart';
// import 'pages/register_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ChangeNotifierProvider(create: (context) => Restaurant()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

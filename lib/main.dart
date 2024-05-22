import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syspotec_app/core/config/bloc_provider.dart';
import 'package:syspotec_app/core/config/paths_config.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MultiBlocProvider(
      providers: providerBloc,
      child: mateApp(textTheme)
    );
  }

  MaterialApp mateApp(TextTheme textTheme) => MaterialApp(
    title: 'Syspotec',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      textTheme: GoogleFonts.montserratTextTheme(textTheme),
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      useMaterial3: true,
    ),
    routes: routesApp(),
    initialRoute: 'login',
  );
}
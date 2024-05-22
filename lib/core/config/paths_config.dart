import 'package:flutter/material.dart';
import 'package:syspotec_app/gui/views/index.dart';

Map<String, WidgetBuilder> routesApp() => <String, WidgetBuilder> {

  'login': ( _ ) => const LoginView(),
  'register': ( _ ) => const RegisterView(),
  'home': ( _ ) => const HomeView(),
  'profile': ( _ ) => const ProfileView(),
  'configuration': ( _ ) => const ConfigurationView(),
  'signedDocuments': ( _ ) => const SignedDocumentsView(),
  'takePhoto': ( _ ) => const TakePhoto(),

};
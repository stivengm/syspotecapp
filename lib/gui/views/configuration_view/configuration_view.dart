import 'package:flutter/material.dart';

class ConfigurationView extends StatelessWidget {
  const ConfigurationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Configuración"),
        centerTitle: true,
      ),
    );
  }
}
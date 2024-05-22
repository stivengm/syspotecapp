import 'package:flutter/material.dart';

class SignedDocumentsView extends StatelessWidget {
  const SignedDocumentsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Documentos Firmados"),
        centerTitle: true,
      ),
    );
  }
}
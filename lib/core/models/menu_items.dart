import 'package:flutter/material.dart';

class MenuItem {

  final String title;
  final IconData icon;
  final String link;

  const MenuItem({
    required this.title,
    required this.icon,
    required this.link,
  });

}

const appMenuItems = <MenuItem> [

  MenuItem(
    title: 'inicio',
    icon: Icons.home,
    link: 'home'
  ),
  MenuItem(
    title: 'Perfil',
    icon: Icons.person_outline_rounded,
    link: 'profile'
  ),
  MenuItem(
    title: 'Documentos Firmados', 
    icon: Icons.settings, 
    link: 'signedDocuments'
  ),
  MenuItem(
    title: 'Configuración', 
    icon: Icons.settings, 
    link: 'configuration'
  )

];
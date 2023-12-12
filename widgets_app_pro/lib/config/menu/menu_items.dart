import 'package:flutter/material.dart';

class MenuItem {
  final String title;
  final String subtitle;
  final String link;
  final IconData icon;

  const MenuItem(
      {required this.title,
      required this.subtitle,
      required this.link,
      required this.icon});
}

const appMenuItems = <MenuItem>[
  MenuItem(
      title: 'Botones',
      subtitle: 'Varios estilos de botones en flutter',
      link: '/buttons',
      icon: Icons.smart_button_outlined),
  MenuItem(
      title: 'Tarjetas',
      subtitle: 'Un contenedor estilizado',
      link: '/cards',
      icon: Icons.credit_card),
  MenuItem(
      title: 'Progress Indicators',
      subtitle: 'Generales y controlados',
      link: '/progress',
      icon: Icons.replay_rounded),
  MenuItem(
      title: 'Snackbars y Dialogos',
      subtitle: 'Indicadores en pantalla',
      link: '/snackbars',
      icon: Icons.warning_amber_rounded),
  MenuItem(
      title: 'Animated container',
      subtitle: 'Stateful widget animado',
      link: '/animated',
      icon: Icons.crop_square),
  MenuItem(
      title: 'UI Controls + Tiles',
      subtitle: 'Una serie de controles de flutter',
      link: '/controls',
      icon: Icons.car_rental),
  MenuItem(
      title: 'Introduccion a la aplicacion',
      subtitle: 'Pequeño tutorial / slideshow introductorio',
      link: '/tutorial',
      icon: Icons.catching_pokemon_outlined),
  MenuItem(
      title: 'Infinite scroll y Pull',
      subtitle: 'Listas infinitas y pull to refresh',
      link: '/infinite',
      icon: Icons.recycling_rounded),
  MenuItem(
      title: 'Counter',
      subtitle: 'Counter usando "riverpod"',
      link: '/counter',
      icon: Icons.calculate),
   MenuItem(
      title: 'Theme Changer',
      subtitle: 'Cambiar tema de la aplicación en tiempo real',
      link: '/theme-changer',
      icon: Icons.color_lens_sharp),
];

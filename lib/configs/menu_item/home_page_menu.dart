import 'package:flutter/material.dart';

List<DrawerTile> drawerTile = [
  DrawerTile(
    name: "My Profile",
    icone: Icons.person_2,
    navigateTo: "my_Profile",
  ),
  DrawerTile(
    name: "My Favorites",
    icone: Icons.favorite,
    navigateTo: "my_favorite",
  ),
  DrawerTile(
    name: "Notifications",
    icone: Icons.notifications,
    navigateTo: "notifications_page",
  ),
  DrawerTile(
    name: "My booking",
    icone: Icons.calendar_today,
    navigateTo: "my_booking",
  ),
  DrawerTile(
    name: "Refer and earn",
    icone: Icons.money,
    navigateTo: "ref_and_earn",
  ),
  DrawerTile(
    name: "Contact Us",
    icone: Icons.mail,
    navigateTo: "contact_page",
  ),
  DrawerTile(
    name: "Help Center",
    icone: Icons.help_center,
    navigateTo: "help_page",
  ),
  DrawerTile(
    name: "Logout",
    icone: Icons.logout,
    navigateTo: "my_Profile",
  ),
];

class DrawerTile {
  final String name;
  final IconData icone;
  final String navigateTo;
  DrawerTile({
    required this.name,
    required this.icone,
    required this.navigateTo,
  });
}

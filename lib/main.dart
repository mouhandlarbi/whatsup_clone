import 'package:flutter/material.dart';
import 'package:state_management/configs/theme/src/light_theme.dart';
import 'package:state_management/main_page.dart';
import 'package:state_management/view/pages/contact_page.dart';
import 'package:state_management/view/pages/favorite_page.dart';
import 'package:state_management/view/pages/help_page.dart';
import 'package:state_management/view/pages/home_page.dart';
import 'package:state_management/view/pages/my_bookings_page.dart';
import 'package:state_management/view/pages/my_profile_page.dart';
import 'package:state_management/view/pages/notification_page.dart';
import 'package:state_management/view/pages/refer_and_earn_page.dart';
import 'package:state_management/view/pages/worker_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: getLightTheme(),
      routes: {
        'home': (_) => const HomePage(),
        'my_Profile': (_) => const MyProfilePage(),
        'my_favorite': (_) => const MyFavoritePage(),
        'notifications_page': (_) => const NotificationsPage(),
        'my_booking': (_) => const MyBookingPage(),
        'ref_and_earn': (_) => const ReferAndEarnPage(),
        'contact_page': (_) => const ContactPage(),
        'help_page': (_) => const HelpPage(),
      },
      home: const MainHomePage(),
    );
  }
}

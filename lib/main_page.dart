import 'package:flutter/material.dart';
import 'package:state_management/view/pages/account_page.dart';
import 'package:state_management/view/pages/chats_list_page.dart';
import 'package:state_management/view/pages/home_page.dart';
import 'package:state_management/view/pages/search_page.dart';

class MainHomePage extends StatefulWidget {
  const MainHomePage({super.key});

  @override
  State<MainHomePage> createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        currentIndex: currentPage,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'inbox',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Account',
          ),
        ],
      ),
      body: pages[currentPage],
    );
  }
}

List<Widget> pages = [
  const HomePage(),
  const SearchPage(),
  const ChatListPage(),
  const Account(),
];

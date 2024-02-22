import 'package:flutter/material.dart';
import 'package:state_management/configs/menu_item/home_page_menu.dart';
import 'package:state_management/data/api/user_api.dart';
import 'package:state_management/data/model/promo.dart';
import 'package:state_management/data/model/user.dart';
import 'package:state_management/data/static/services.dart';
import 'package:state_management/view/components/home_page/circle_swiper.dart';
import 'package:state_management/view/components/home_page/promo_slider.dart';
import 'package:state_management/view/components/home_page/rectangle_swiper.dart';
import 'package:state_management/view/components/home_page/search_feild.dart';
import 'package:state_management/view/components/home_page/squar_swiper.dart';
import 'package:state_management/view/components/home_page/title_divider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            FutureBuilder<List<User>>(
              future: UsersApi.getUsersLocally(context),
              builder: (context, snapshot) {
                final users = snapshot.data;
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return const Center(child: CircularProgressIndicator());
                  default:
                    if (snapshot.hasError) {
                      return const Center(
                        child: Text('Error'),
                      );
                    } else {
                      return UserAccountsDrawerHeader(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                        ),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.amber,
                          backgroundImage: AssetImage(users![0].urlAvatar),
                        ),
                        currentAccountPictureSize: const Size.square(64),
                        accountName: Text(
                          users[0].username,
                          style: const TextStyle(
                              color: Colors.black, fontSize: 16),
                        ),
                        accountEmail: Text(
                          users[0].email,
                          style:
                              const TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      );
                    }
                }
              },
            ),
            ...drawerTile
                .map((e) => DrawerListTile(
                      txt: e.name,
                      icone: e.icone,
                      navigateTo: e.navigateTo,
                    ))
                .toList(),
          ],
        ),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              //Navigator.of(context).pushNamed("Notifications");
            },
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: ListView(
        children: [
          const SearchFeild(),
          PromoSlider(
            promos: prmos,
          ),
          const TitleDivider(txt: "Home Services"),
          CircleSwiper(services: homeServices),
          const TitleDivider(txt: "popular Services"),
          SquarSwiper(services: otherServices),
          const TitleDivider(txt: "renovate your home"),
          RectangleSwiper(services: renovateHome),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.txt,
    required this.icone,
    required this.navigateTo,
  });
  final String txt;
  final IconData icone;
  final String navigateTo;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(navigateTo);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 4),
        child: Row(
          children: [
            Icon(icone),
            const SizedBox(width: 4),
            Text(txt),
          ],
        ),
      ),
    );
  }
}

List<Promo> prmos = [
  Promo(img: "assets/images/promo.jpg", pageRoute: "help_page"),
  Promo(img: "assets/images/promo.jpg", pageRoute: "help_page"),
  Promo(img: "assets/images/promo.jpg", pageRoute: "help_page"),
  Promo(img: "assets/images/promo.jpg", pageRoute: "help_page"),
];

List<OtherService> otherServices = [
  OtherService(
    txt: "txt",
    icone: Icons.settings_applications,
    image: "assets/images/service.jpg",
    navigatTo: "contact_page",
  ),
  OtherService(
    txt: "txt",
    icone: Icons.settings_applications,
    image: "assets/images/service.jpg",
    navigatTo: "contact_page",
  ),
  OtherService(
    txt: "txt",
    icone: Icons.settings_applications,
    image: "assets/images/service.jpg",
    navigatTo: "contact_page",
  ),
  OtherService(
    txt: "txt",
    icone: Icons.settings_applications,
    image: "assets/images/service.jpg",
    navigatTo: "contact_page",
  ),
  OtherService(
    txt: "txt",
    icone: Icons.settings_applications,
    image: "assets/images/service.jpg",
    navigatTo: "contact_page",
  ),
];

List<OtherService> renovateHome = [
  OtherService(
    txt: "Home interior",
    icone: Icons.settings_applications,
    image: "assets/images/worker.jpg",
    navigatTo: "contact_page",
  ),
  OtherService(
    txt: "Modular kitchen",
    icone: Icons.settings_applications,
    image: "assets/images/worker.jpg",
    navigatTo: "contact_page",
  ),
  OtherService(
    txt: "comercial building",
    icone: Icons.settings_applications,
    image: "assets/images/worker.jpg",
    navigatTo: "contact_page",
  ),
  OtherService(
    txt: "office interior",
    icone: Icons.settings_applications,
    image: "assets/images/worker.jpg",
    navigatTo: "contact_page",
  ),
  OtherService(
    txt: "txt",
    icone: Icons.settings_applications,
    image: "assets/images/worker.jpg",
    navigatTo: "contact_page",
  ),
];

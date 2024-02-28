import 'package:flutter/material.dart';
import 'package:state_management/configs/menu_item/home_page_menu.dart';
import 'package:state_management/data/model/business.dart';
import 'package:state_management/data/model/user.dart';
import 'package:state_management/data/model/project.dart';
import 'package:state_management/data/repo/business_repository.dart';
import 'package:state_management/data/repo/project_repository.dart';
import 'package:state_management/data/repo/user_repository.dart';
import 'package:state_management/view/components/home_page/circle_swiper.dart';
import 'package:state_management/view/components/home_page/promo_slider.dart';
import 'package:state_management/view/components/commun/rectangle_swiper.dart';
import 'package:state_management/view/components/home_page/squar_swiper.dart';
import 'package:state_management/view/components/commun/title_divider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];
  List<Business> businesses = [];
  List<Project> projects = [];
  UserRepository userRepository = UserRepository();
  BusinessRepository businessRepository = BusinessRepository();
  ProjectRepository projectRepository = ProjectRepository();
  bool pisLoading = false;
  bool isLoading = false;
  bool bisLoading = false;
  setUser() async {
    isLoading = true;
    bisLoading = true;
    bisLoading = true;
    setState(() {});
    //users = await UsersApi.getUsersLocally(context);
    users = await userRepository.getUsers();
    businesses = await businessRepository.getBusinesss();
    projects = await projectRepository.getProjects();
    isLoading = false;
    bisLoading = false;
    bisLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    setUser();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: [
            isLoading
                ? const CircularProgressIndicator()
                : UserAccountsDrawerHeader(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                    currentAccountPicture: CircleAvatar(
                      backgroundColor: Colors.amber,
                      backgroundImage: AssetImage(users[0].urlAvatar),
                    ),
                    currentAccountPictureSize: const Size.square(64),
                    accountName: Text(
                      "${users[0].username}.${users[0].hasBusiness}", //users[0].username,
                      style: const TextStyle(color: Colors.black, fontSize: 16),
                    ),
                    accountEmail: Text(
                      users[0].email,
                      style: const TextStyle(color: Colors.grey, fontSize: 14),
                    ),
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
          //const SearchFeild(),
          const PromoSlider(),
          const TitleDivider(txt: "Home Services"),
          CircleSwiper(services: services),
          const TitleDivider(txt: "popular Services"),
          bisLoading
              ? const Text("data")
              : SquarSwiper(
                  businesses: businesses,
                ),
          const TitleDivider(txt: "shop now"),
          RectangleSwiper(projects: projects),
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

class OtherService {
  final String txt;
  final IconData icone;
  final String image;
  final String navigatTo;
  OtherService(
      {required this.txt,
      required this.icone,
      required this.image,
      required this.navigatTo});
}

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
    txt: "txddt",
    icone: Icons.settings_applications,
    image: "assets/images/service.jpg",
    navigatTo: "contact_page",
  ),
];

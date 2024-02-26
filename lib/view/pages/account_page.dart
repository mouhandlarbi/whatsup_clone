import 'package:flutter/material.dart';
import 'package:state_management/data/model/user.dart';
import 'package:state_management/data/repo/user_repository.dart';
import 'package:state_management/view/components/commun/title_divider.dart';

class Account extends StatefulWidget {
  const Account({super.key});

  @override
  State<Account> createState() => _AccountState();
}

class _AccountState extends State<Account> {
  List<User> users = [];
  late PageController pageController;
  int currentPage = 0;
  UserRepository userRepository = UserRepository();
  bool isLoading = false;
  setUser() async {
    isLoading = true;
    setState(() {});
    users = await userRepository.getUsers();
    isLoading = false;
    setState(() {});
  }

  @override
  void initState() {
    setUser();
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SafeArea(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      "Account",
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.red,
                    backgroundImage: AssetImage(users[0].urlAvatar),
                    radius: 64,
                  ),
                  Text(
                    users[0].username,
                    style: const TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    users[0].email,
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(
                    width: double.infinity,
                  ),
                  Container(
                    height: 240,
                    //color: Colors.red,
                    child: Column(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        pageController.animateToPage(0,
                                            duration: const Duration(
                                                microseconds: 300),
                                            curve: Curves.ease);
                                      },
                                      child: Text(
                                        "business",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: currentPage == 0
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Center(
                                    child: InkWell(
                                      onTap: () {
                                        pageController.animateToPage(1,
                                            duration: const Duration(
                                                microseconds: 300),
                                            curve: Curves.ease);
                                      },
                                      child: Text(
                                        "Store",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: currentPage == 1
                                              ? Colors.black
                                              : Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                        Expanded(
                          flex: 4,
                          child: PageView(
                            controller: pageController,
                            onPageChanged: (value) {
                              setState(() {
                                currentPage = value;
                              });
                            },
                            scrollDirection: Axis.horizontal,
                            children: [
                              Center(
                                child: users[0].hasBusiness
                                    ? const Text("this is business data")
                                    : ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("open a business"),
                                      ),
                              ),
                              Center(
                                child: users[0].hasBusiness
                                    ? const Text("this is store data")
                                    : ElevatedButton(
                                        onPressed: () {},
                                        child: const Text("open a store"),
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const TitleDivider(txt: "Favorite business"),
                  const TitleDivider(txt: "Favorite store"),
                ],
              ),
            ),
    );
  }
}

class StoreResume extends StatelessWidget {
  const StoreResume({super.key, required this.store});
  final Store store;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      padding: const EdgeInsets.all(4),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                decoration: BoxDecoration(
                  //color: Colors.amber,
                  borderRadius: BorderRadius.circular(12),
                  image: DecorationImage(
                    image: AssetImage(
                      store.photo,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              padding: const EdgeInsets.all(4),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    store.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    "${store.name}@gmail.com",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "likes",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        store.like,
                        style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.red),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Store {
  final String name;
  final String like;
  final String photo;
  Store({
    required this.name,
    required this.like,
    required this.photo,
  });
}

Store store =
    Store(name: "amine marbel", like: "22", photo: "assets/images/profile.jpg");

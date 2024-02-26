import 'package:flutter/material.dart';
import 'package:state_management/data/model/business.dart';
import 'package:state_management/data/model/worker.dart';
import 'package:state_management/view/components/commun/rectangle_swiper.dart';
import 'package:state_management/view/components/commun/title_divider.dart';

class BusinessDetailPage extends StatelessWidget {
  const BusinessDetailPage({
    super.key,
    required this.business,
  });
  final Business business;

  @override
  Widget build(BuildContext context) {
    final List<String> skills = ["plumber", "pinter"];
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          // Text(
          //   business.description!,
          //   style: TextStyle(
          //     fontSize: 16,
          //     fontWeight: FontWeight.w400,
          //     color: Colors.grey[600],
          //   ),
          // ),
          //DetailsImage(business: business),
          SimpleProfile(
            business: business,
          ),
          const Divider(
            thickness: 2,
          ),
          business.isIndividual
              ? Individual(
                  skills: skills,
                )
              : BusinessInformation(business: business, skills: skills),

          const Divider(
            thickness: 2,
          ),
          const TitleDivider(txt: "Recent Projects"),
          //DetailsImage(business: business),
          RectangleSwiper(projects: fakeProject),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("message"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Appeler"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class DetailsImage extends StatelessWidget {
  const DetailsImage({super.key, required this.business});
  final Business business;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        color: Colors.amber,
        image: DecorationImage(
          image:
              AssetImage(business.businessLogo ?? "assets/images.profile.jpg"),
          fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.0),
                    ])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const DetailsImageItem(
                  title: "jobs",
                  isIcon: false,
                  subtile: "120",
                ),
                const DetailsImageItem(
                  title: "Share",
                  isIcon: true,
                  icone: Icons.share,
                ),
                DetailsImageItem(
                  title: "Rating",
                  isIcon: false,
                  subtile: business.rating.toString(),
                ),
                const DetailsImageItem(
                  title: "Share",
                  isIcon: true,
                  icone: Icons.favorite,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DetailsImageItem extends StatelessWidget {
  const DetailsImageItem(
      {super.key,
      required this.title,
      required this.isIcon,
      this.icone,
      this.subtile});
  final String title;
  final bool isIcon;
  final String? subtile;
  final IconData? icone;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
        isIcon
            ? Icon(
                icone,
                color: Colors.white,
              )
            : Text(
                subtile!,
                style: const TextStyle(color: Colors.white),
              ),
      ],
    );
  }
}

class SimpleProfile extends StatelessWidget {
  const SimpleProfile({super.key, required this.business});
  final Business business;
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
                      business.businessLogo ?? "assets/images/profile.jpg",
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
                    business.businessName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    business.businessEmail ?? "replace_with@user_email.com",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                  const Rating(rating: 3.8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Availabale",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                            color: business.isAvailable
                                ? Colors.green
                                : Colors.red,
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          business.isAvailable ? "yes" : "no",
                          style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
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

class Rating extends StatelessWidget {
  const Rating({super.key, required this.rating});
  final double rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          rating.toString(),
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        ...starPainter(
          rating.floor(),
        ),
      ],
    );
  }

  List<Widget> starPainter(int colored) {
    List<Widget> ss = [];
    for (int i = 0; i < 5; i++) {
      i < colored
          ? ss.add(
              const Icon(
                Icons.star,
                color: Colors.amber,
              ),
            )
          : ss.add(
              const Icon(
                Icons.star,
                color: Colors.grey,
              ),
            );
    }
    return ss;
  }
}

class Individual extends StatelessWidget {
  const Individual({
    super.key,
    required this.skills,
  });
  final List<String> skills;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Column(
        children: [
          Row(children: [
            const Text(
              "Skills : ",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            ...skills
                .map(
                  (e) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        e,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                )
                .toList(),
          ]),
          const Row(
            children: [
              Text(
                "pricing : ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                "€22.5/h",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class BusinessInformation extends StatelessWidget {
  const BusinessInformation(
      {super.key, required this.business, required this.skills});
  final Business business;
  final List<String> skills;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      child: Row(
        children: [
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Row(children: [
                  const Text(
                    "Skills : ",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ...skills
                      .map(
                        (e) => Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              e,
                              style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ]),
                const Row(
                  children: [
                    Text(
                      "pricing : ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "€22.5/h",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    const Text(
                      "localisation : ",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      business.local,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          )
        ],
      ),
    );
  }
}

List<Project> fakeProject = [
  Project(
    name: "2 bedroom painting",
    thumbnail: "assets/images/portfolio_0.jpg",
    images: [
      "assets/images/portfolio_0.jpg",
      "assets/images/portfolio_0.jpg",
    ],
    dateTime: "DateTime.now",
    description:
        "Moonlight dripped through ancient oaks, weaving shadows on moss-covered stones. A lone owl hooted, its cry echoing through the stillness. A fox rustled in the undergrowth, its eyes gleaming emeralds in the darkness.",
  ),
  Project(
    name: "2 bedroom painting",
    thumbnail: "assets/images/portfolio_1.jpg",
    images: [
      "assets/images/portfolio_1.jpg",
      "assets/images/portfolio_1.jpg",
    ],
    dateTime: "DateTime.now()",
    description:
        "Moonlight dripped through ancient oaks, weaving shadows on moss-covered stones. A lone owl hooted, its cry echoing through the stillness. A fox rustled in the undergrowth, its eyes gleaming emeralds in the darkness.",
  ),
  Project(
    name: "2 bedroom painting",
    thumbnail: "assets/images/portfolio_2.jpg",
    images: [
      "assets/images/portfolio_2.jpg",
      "assets/images/portfolio_2.jpg",
    ],
    dateTime: "DateTime.now()",
    description:
        "Moonlight dripped through ancient oaks, weaving shadows on moss-covered stones. A lone owl hooted, its cry echoing through the stillness. A fox rustled in the undergrowth, its eyes gleaming emeralds in the darkness.",
  ),
];

import 'package:flutter/material.dart';
import 'package:state_management/data/model/worker.dart';
import 'package:state_management/view/components/commun/worker_card.dart';

class WorkerList extends StatelessWidget {
  const WorkerList({
    super.key,
    required this.service,
  });
  final Servicee service;
  final String serviceName = "plumber";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("looking for ${service.name}"),
        centerTitle: true,
      ),
      body: ListView(
        children: workers.map((e) => WorkerCard(worker: e)).toList(),
      ),
    );
  }
}

List<Worker> workers = [
  Worker(
    name: "ali ben jordan",
    email: "alidali@gmail.com",
    numberPhone: "0783469244",
    profileImage: "assets/images/service.jpg",
    portfolio: [
      Project(
        name: "2 bedroom painting",
        thumbnail: "assets/images/portfolio_0.jpg",
        images: [
          "assets/images/portfolio_0.jpg",
          "assets/images/portfolio_0.jpg",
        ],
        dateTime: DateTime.now(),
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
        dateTime: DateTime.now(),
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
        dateTime: DateTime.now(),
        description:
            "Moonlight dripped through ancient oaks, weaving shadows on moss-covered stones. A lone owl hooted, its cry echoing through the stillness. A fox rustled in the undergrowth, its eyes gleaming emeralds in the darkness.",
      ),
    ],
    services: fakeSrvicesList,
    price: 22,
    rating: 4.5,
    isAvailable: true,
    description:
        "weaving shadows on moss-covered stones. A lone owl hooted, its cry echoing through the stillness. A fox rustled in the undergrowth, its eyes gleaming emeralds in the darkness. The air hummed with unseen life",
  ),
  Worker(
    name: "mohand oupatrick",
    email: "mohandoupatrick@gmail.com",
    numberPhone: "0783469244",
    profileImage: "assets/images/service.jpg",
    portfolio: [
      Project(
        name: "2 bedroom painting",
        thumbnail: "assets/images/portfolio_0.jpg",
        images: [
          "assets/images/portfolio_0.jpg",
          "assets/images/portfolio_0.jpg",
        ],
        dateTime: DateTime.now(),
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
        dateTime: DateTime.now(),
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
        dateTime: DateTime.now(),
        description:
            "Moonlight dripped through ancient oaks, weaving shadows on moss-covered stones. A lone owl hooted, its cry echoing through the stillness. A fox rustled in the undergrowth, its eyes gleaming emeralds in the darkness.",
      ),
    ],
    services: fakeSrvicesList,
    price: 14,
    rating: 4.0,
    isAvailable: true,
    description:
        "weaving shadows on moss-covered stones. A lone owl hooted, its cry echoing through the stillness. A fox rustled in the undergrowth, its eyes gleaming emeralds in the darkness. The air hummed with unseen life",
  ),
];

List<Servicee> fakeSrvicesList = [
  Servicee(
    name: "plumber",
    icone: Icons.plumbing,
    image: "assets/images/profile.jpg",
  ),
  Servicee(
    name: "electrician",
    icone: Icons.thunderstorm,
    image: "assets/images/profile.jpg",
  ),
];

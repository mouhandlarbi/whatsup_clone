import 'package:flutter/material.dart';

class Service {
  final String txt;
  final IconData icone;
  final String image;
  final String navigatTo;
  Service(
      {required this.txt,
      required this.icone,
      required this.image,
      required this.navigatTo});
}

class HomeService extends Service {
  HomeService(
      {required super.txt,
      required super.icone,
      required super.image,
      required super.navigatTo});
}

class OtherService extends Service {
  OtherService(
      {required super.txt,
      required super.icone,
      required super.image,
      required super.navigatTo});
}

List<HomeService> homeServices = [
  HomeService(
    txt: "Painting",
    icone: Icons.pinch,
    image: "/image",
    navigatTo: "my_booking",
  ),
  HomeService(
    txt: "Carpenter",
    icone: Icons.ssid_chart,
    image: "/image",
    navigatTo: "my_booking",
  ),
  HomeService(
    txt: "Electrician",
    icone: Icons.analytics,
    image: "/image",
    navigatTo: "my_booking",
  ),
  HomeService(
    txt: "gardener",
    icone: Icons.quora,
    image: "/image",
    navigatTo: "my_booking",
  ),
  HomeService(
    txt: "Cleaning",
    icone: Icons.pinch,
    image: "/image",
    navigatTo: "my_booking",
  ),
  HomeService(
    txt: "Car cleaning",
    icone: Icons.clear,
    image: "/image",
    navigatTo: "my_booking",
  ),
  HomeService(
    txt: "plumber",
    icone: Icons.plumbing,
    image: "/image",
    navigatTo: "my_booking",
  ),
];

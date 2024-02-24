import 'package:flutter/material.dart';

class Worker {
  final String name;
  final String email;
  final String numberPhone;
  final String profileImage;
  final List<Project> portfolio;
  final List<Servicee> services;
  final double price;
  final double rating;
  final bool isAvailable;
  final String description;
  Worker({
    required this.name,
    required this.email,
    required this.numberPhone,
    required this.profileImage,
    required this.portfolio,
    required this.services,
    required this.price,
    required this.rating,
    required this.isAvailable,
    required this.description,
  });
}

class Project {
  final String name;
  final String thumbnail;
  final List<String> images;
  final String description;
  DateTime dateTime;
  Project({
    required this.name,
    required this.thumbnail,
    required this.images,
    required this.dateTime,
    required this.description,
  });
}

class Servicee {
  final String name;
  final IconData icone;
  final String image;
  Servicee({
    required this.name,
    required this.icone,
    required this.image,
  });
}

List<Servicee> services = [
  Servicee(
      name: "Painting", icone: Icons.pinch, image: "assets/images/service.jpg"),
  Servicee(
      name: "Carpenter",
      icone: Icons.ssid_chart,
      image: "assets/images/service.jpg"),
  Servicee(
      name: "Electrician",
      icone: Icons.thunderstorm,
      image: "assets/images/service.jpg"),
  Servicee(
      name: "gardener", icone: Icons.grass, image: "assets/images/service.jpg"),
  Servicee(
      name: "Cleaning",
      icone: Icons.clean_hands,
      image: "assets/images/service.jpg"),
  Servicee(
      name: "plumber",
      icone: Icons.plumbing,
      image: "assets/images/service.jpg"),
];

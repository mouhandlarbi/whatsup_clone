// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Worker {
  final String name;
  final String email;
  final String numberPhone;
  final String profileImage;
  final List<Project> portfolio;

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
    required this.price,
    required this.rating,
    required this.isAvailable,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'numberPhone': numberPhone,
      'profileImage': profileImage,
      'portfolio': portfolio.map((x) => x.toMap()).toList(),
      'price': price,
      'rating': rating,
      'isAvailable': isAvailable,
      'description': description,
    };
  }

  factory Worker.fromMap(Map<String, dynamic> map) {
    return Worker(
      name: map['name'] as String,
      email: map['email'] as String,
      numberPhone: map['numberPhone'] as String,
      profileImage: map['profileImage'] as String,
      portfolio: List<Project>.from(
        (map['portfolio']).map<Project>(
          (x) => Project.fromMap(x as Map<String, dynamic>),
        ),
      ),
      price: map['price'] * 1.0,
      rating: map['rating'] * 1.0,
      isAvailable: map['isAvailable'] as bool,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Worker.fromJson(String source) =>
      Worker.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Project {
  final String name;
  final String thumbnail;
  final List<String> images;
  final String description;
  final String dateTime;
  Project({
    required this.name,
    required this.thumbnail,
    required this.images,
    required this.dateTime,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'thumbnail': thumbnail,
      'images': images,
      'description': description,
      'dateTime': dateTime,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      name: map['name'] as String,
      dateTime: map['dateTime'] as String,
      thumbnail: map['thumbnail'] as String,
      images: List<String>.from((map['images'])),
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Project.fromJson(String source) =>
      Project.fromMap(json.decode(source) as Map<String, dynamic>);
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

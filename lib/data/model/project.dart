// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class Project {
  final String projectId;
  final String name;
  final String thumbnail;
  final List<String> images;
  final String description;
  final String dateTime;
  Project({
    required this.projectId,
    required this.name,
    required this.thumbnail,
    required this.images,
    required this.dateTime,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'projectId': projectId,
      'name': name,
      'thumbnail': thumbnail,
      'images': images,
      'description': description,
      'dateTime': dateTime,
    };
  }

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      projectId: map['projectId'] as String,
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

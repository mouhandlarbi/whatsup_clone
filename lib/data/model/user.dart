import 'package:state_management/data/model/worker.dart';

class User {
  final String username;
  final String email;
  final String urlAvatar;
  final String phoneNumber;
  List<Worker>? favorite;
  User(
      {required this.username,
      required this.email,
      required this.urlAvatar,
      required this.phoneNumber,
      this.favorite});

  static User fromJson(json) => User(
        username: json['username'],
        email: json['email'],
        urlAvatar: json['urlAvatar'],
        phoneNumber: json['phoneNumber'],
        favorite: [], //json['favorite'],
      );
}

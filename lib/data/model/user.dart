class User {
  String userId;
  String username;
  String email;
  String urlAvatar;
  String? phoneNumber;
  bool hasStore;
  String? storeId;
  bool hasBusiness;
  String? businessId;

  User({
    required this.userId,
    required this.username,
    required this.email,
    required this.urlAvatar,
    this.phoneNumber,
    this.businessId,
    this.storeId,
    required this.hasBusiness,
    required this.hasStore,
  });

  static User fromMap(Map<String, dynamic> map) {
    return User(
      username: map['username'],
      email: map['email'],
      urlAvatar: map['urlAvatar'],
      phoneNumber: map['phoneNumber'],
      businessId: map["businessId"],
      userId: map["userId"],
      storeId: map["storeId"],
      hasBusiness: map["hasBusiness"],
      hasStore: map["hasStore"],
    );
  }
}




//------------------------------------------------------------------------------


// class User {
//   final String username;
//   final String email;
//   final String urlAvatar;
//   final String phoneNumber;
//   List<Worker>? favorite;
//   User(
//       {required this.username,
//       required this.email,
//       required this.urlAvatar,
//       required this.phoneNumber,
//       this.favorite});

//   static User fromJson(json) => User(
//         username: json['username'],
//         email: json['email'],
//         urlAvatar: json['urlAvatar'],
//         phoneNumber: json['phoneNumber'],
//         favorite: [], //json['favorite'],
//       );
// }

// [
//   {
//   "username":"Emma Spoon",
//   "email":"EmmaSpoon@gmail.com",
//   "urlAvatar":"assets/images/profile.jpg",
//   "phoneNumber":"07 83 13 64 83",
//   "favorite":[]
//   },
//   {
//   "username":"said slimana",
//   "email":"saidslimana@gmail.com",
//   "urlAvatar":"assets/images/profile.jpg",
//   "phoneNumber":"07 83 13 64 83",
//   "favorite":[]
//   }
// ]
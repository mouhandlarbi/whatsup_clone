import 'package:state_management/data/api/user_api.dart';
import 'package:state_management/data/model/user.dart';

class UserRepository {
  factory UserRepository() {
    return _userRepository;
  }
  UserRepository._();
  static final UserRepository _userRepository = UserRepository._();
  UserApi api = UserApi();

  Future<List<User>> getUsers() async {
    var res = await api.getUsersLocally();
    //List list = res.data['users'];
    //return res.map((e) => User.fromMap(e)).toList();
    return res.map((e) => User.fromMap(e)).toList();
  }
}

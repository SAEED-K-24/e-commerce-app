import 'package:flutter/cupertino.dart';

import '../helper/dummydata.dart';
import '../model/user.dart';

class UsersProvider extends ChangeNotifier {
  List<User> users = [];
  User? user;

  getAllUsers() {
    List<User> loadedUsers = [];
    for (int i = 0; i < DummyData.dummyUsers.length; i++) {
      loadedUsers.add(User.fromJson(DummyData.dummyUsers.elementAt(i)));
    }
    users = loadedUsers;
  }

  getOneUser() {
    List<User> loadedUsers = [];
    for (int i = 0; i < DummyData.dummyUsers.length; i++) {
      if (DummyData.dummyUsers.elementAt(i)['id'] == 1) {
        loadedUsers.add(User.fromJson(DummyData.dummyUsers.elementAt(i)));
      }
    }
    user = loadedUsers.elementAt(0);
  }
}

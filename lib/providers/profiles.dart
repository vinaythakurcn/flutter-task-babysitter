import 'package:babysitter/models/profile.dart';
import 'package:flutter/material.dart';

class ProfilesState with ChangeNotifier {
  List<Profile> profiles = [];

  fetchAllProfiles() {
    /**
     * Using Future.delayed to represent API call
     */
    Future.delayed(const Duration(milliseconds: 700), () {
      profiles = [
        Profile(
            id: 1, name: 'ליאת 1', imagePath: "images/profile/profile1.png"),
        Profile(
            id: 2, name: 'ליאת 2', imagePath: "images/profile/profile2.png"),
        Profile(
            id: 3, name: 'ליאת 3', imagePath: "images/profile/profile1.png"),
        Profile(
            id: 4, name: 'ליאת 4', imagePath: "images/profile/profile2.png"),
        Profile(
            id: 5, name: 'ליאת 5', imagePath: "images/profile/profile1.png"),
        Profile(
            id: 6, name: 'ליאת 6', imagePath: "images/profile/profile2.png"),
        Profile(
            id: 7, name: 'ליאת 7', imagePath: "images/profile/profile1.png"),
        Profile(
            id: 8, name: 'ליאת 8', imagePath: "images/profile/profile2.png"),
        Profile(
            id: 9, name: 'ליאת 9', imagePath: "images/profile/profile1.png"),
        Profile(
            id: 10, name: 'ליאת 10', imagePath: "images/profile/profile2.png"),
      ];
      notifyListeners();
    });
  }

  removeProfile(int i) {
    profiles.removeAt(i);
    notifyListeners();
  }
}

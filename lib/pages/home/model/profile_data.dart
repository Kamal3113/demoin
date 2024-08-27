import 'package:flutter/material.dart'; // Ensure you're using the correct material package

class ProfileData {
  final int id;
  final Icon icon;
  final String title;

  ProfileData({
    required this.id,
    required this.icon,
    required this.title,
  });
}

List<ProfileData> profileData = [
  ProfileData(id: 1, icon: Icon(Icons.restaurant,color: Colors.grey,size: 22,), title: "Daily diets"),
  ProfileData(id: 2, icon: Icon(Icons.fitness_center,color: Colors.grey,size: 22,), title: "Activity history"),
  ProfileData(id: 3, icon: Icon(Icons.logout,color: Colors.grey,size: 22,), title: "Logout"),
];

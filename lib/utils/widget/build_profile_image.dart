import 'package:flutter/material.dart';

Widget buildProfileImage(double height) => CircleAvatar(
      radius: height / 3,
      backgroundColor: Colors.grey.shade500,
      backgroundImage: const AssetImage('assets/images/personne.png'),
    );

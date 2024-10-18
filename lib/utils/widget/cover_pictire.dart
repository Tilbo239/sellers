import 'package:flutter/material.dart';

Widget buildCoverImage(double height) => Container(
      color: Colors.grey,
      child: Image.asset(
        "assets/images/casque06.jpg",
        width: double.infinity,
        height: height,
        fit: BoxFit.cover,
      ),
    );

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

Widget buildProfileImage(double height, Rx<File?> imageProfile) => Stack(
      children: [
        imageProfile.value == null
            ? CircleAvatar(
                radius: height / 2.8,
                child: CircleAvatar(
                    radius: height / 3,
                    backgroundColor: Colors.grey.shade500,
                    backgroundImage:
                        const AssetImage('assets/images/personne.png')))
            : ClipOval(
                child: Image.file(
                  imageProfile.value!,
                  width: 160,
                  height: 160,
                  fit: BoxFit.cover,
                ),
              ),
        Positioned(
          top: height / 1.9,
          left: height / 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(100),
            ),
            padding: const EdgeInsets.all(3),
            child: const Icon(
              Icons.add_a_photo_outlined,
              size: 25,
              color: Colors.black,
            ),
          ),
        )
      ],
    );

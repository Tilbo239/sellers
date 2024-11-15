import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget buildCoverImage(double height, Rx<File?> coverPicture) => Stack(
      children: [
        coverPicture.value == null
            ? Container(
                color: Colors.grey,
                child: Image.asset(
                  "assets/images/no_image.png",
                  width: double.infinity,
                  // height: height,
                  fit: BoxFit.cover,
                ),
              )
            : Image.file(
                coverPicture.value!,
                fit: BoxFit.fitWidth,
                width: double.infinity,
              ),
        Positioned(
          // height: height,
          // top: height / 9,
          // left: height / 5,
          right: height / 10,
          bottom: height / 17,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            padding: const EdgeInsets.all(10),
            child: const Icon(
              Icons.add_a_photo_outlined,
              size: 25,
              color: Colors.black,
            ),
          ),
        )
      ],
    );

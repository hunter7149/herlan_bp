import 'package:flutter/material.dart';

import 'appcolors.dart';

class COMMONWIDGET {
  static loginInput(
      {required String hinttext,
      required TextEditingController controller,
      required bool obsecure}) {
    return TextField(
      controller: controller,
      obscureText: obsecure,
      decoration: InputDecoration(
          hintText: hinttext,
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColors.herlanMain,
              width: 1,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColors.herlanMain,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: AppColors.modernChocolate,
              width: 1,
            ),
          ),
          prefixIcon: Icon(
            Icons.email,
            color: AppColors.herlanMain,
          )),
    );
  }
}

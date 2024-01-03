import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SearchWidget extends StatelessWidget {
  SearchWidget({
    super.key,
    required this.controller,
    required this.onPressed,
  });
  TextEditingController controller;
  Function onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.r),
        color: Colors.grey.withOpacity(0.2),
      ),
      child: TextField(
        controller: controller,
        // textInputAction: TextInputAction.search,
        onSubmitted: (value) => () {
          print(value);
        },
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          hintText: 'Search',
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}

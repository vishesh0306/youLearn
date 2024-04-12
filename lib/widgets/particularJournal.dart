
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget buildJournal() {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 170.h,
      width: 170.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Color(0xffCDC6F2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 2.5),
            child: Container(
              height: 64.h,
              width: 60.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xffABABAB),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 2.5, 10, 5),
            child: SizedBox(
              width: 139.69.w,
              height: 60.h,
              child: Text(
                "School is going for vacation in next month",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w500),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Text(
              "22  March 2020",
              style: TextStyle(
                  fontSize: 13.sp, color: Colors.black.withOpacity(0.2)),
            ),
          ),
        ],
      ),
    ),
  );
}
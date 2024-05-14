import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_day_15/pages/homework/tic_tac_toe.dart';
import 'package:flutter_day_15/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Welcome extends StatelessWidget {
  Welcome({super.key});

  final nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff527ec0),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Welcome to Tic Tac Toe!\nGet ready for some Xs and Os!',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18.sp,
            ),
          ),
          20.height,
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w),
            child: TextField(
              controller: nameController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.amber, width: 2),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.amber, width: 2),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide(color: Colors.amber, width: 2),
                  ),
                  hintText: 'Enter your name here',
                  hintStyle: TextStyle(color: Colors.white54)),
            ),
          ),
          20.height,
          GestureDetector(
            onTap: () {
              if (nameController.text.trim().isEmpty) {
                return;
              }
              Navigator.of(context).push(
                CupertinoPageRoute(
                  builder: (context) =>
                      TicTacToe(userName: nameController.text),
                ),
              );
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
              decoration: BoxDecoration(
                color: const Color(0xff4cb44e),
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Text(
                "Let's Play",
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
              ),
            ),
          )
        ],
      ),
    );
  }
}

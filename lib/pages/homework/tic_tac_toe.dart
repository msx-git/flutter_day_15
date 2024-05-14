import 'package:flutter/material.dart';
import 'package:flutter_day_15/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../generated/assets.dart';

class TicTacToe extends StatefulWidget {
  TicTacToe({super.key, required this.userName});

  final String userName;

  @override
  State<TicTacToe> createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe> {
  final winningPositions = const [
    '123',
    '321',
    '456',
    '654',
    '789',
    '987',
    '147',
    '741',
    '258',
    '852',
    '369',
    '963',
    '159',
    '951',
    '753',
    '357',
  ];
  bool isGameOver = false;
  var xPositions = '';

  var oPositions = '';

  bool checkWinning(List winningPosition, String currentPosition) {
    bool inInside = false;
    for (String winning in winningPosition) {
      for (String x in winning.split('')) {
        if (currentPosition.contains(x)) {
          isGameOver = true;
          inInside = true;
        } else {
          isGameOver = false;
          inInside = false;
        }
      }
      // if (currentPosition.contains(winning)) {
      //   isGameOver = true;
      //   return true;
      // }
      // isGameOver = inInside;
      // return inInside;
    }
    return inInside;
  }

  bool isX = true;

  List<Widget?> widgets = [
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
    null,
  ];

  @override
  Widget build(BuildContext context) {
    print("xPositions: $xPositions");
    print("oPositions: $oPositions");
    return Scaffold(
      backgroundColor: const Color(0xff48a3c4),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SafeArea(child: 30.height),
          Text(
              '${checkWinning(winningPositions, isX ? oPositions : xPositions)}'),
          GridView(
            padding: EdgeInsets.all(20.r),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            children: [
              /// 1
              GestureDetector(
                onTap: widgets[0] == null && !isGameOver
                    ? () {
                        isX ? xPositions += '1' : oPositions += '1';
                        checkWinning(
                            winningPositions, isX ? xPositions : oPositions);
                        widgets[0] = Image.asset(
                          isX ? Assets.imagesX : Assets.imagesO,
                          width: 40.w,
                          height: 40.h,
                        );
                        isX = !isX;
                        setState(() {});
                      }
                    : null,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: widgets[0],
                ),
              ),

              /// 2
              GestureDetector(
                onTap: widgets[1] == null && !isGameOver
                    ? () {
                        isX ? xPositions += '2' : oPositions += '2';
                        checkWinning(winningPositions, isX ? xPositions : oPositions);
                        widgets[1] = Image.asset(
                          isX ? Assets.imagesX : Assets.imagesO,
                          width: 40.w,
                          height: 40.h,
                        );
                        isX = !isX;
                        setState(() {});
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      right: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                      left: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: widgets[1],
                ),
              ),

              /// 3
              GestureDetector(
                onTap: widgets[2] == null && !isGameOver
                    ? () {
                        isX ? xPositions += '3' : oPositions += '3';
                        checkWinning(winningPositions, isX ? xPositions : oPositions);
                        widgets[2] = Image.asset(
                          isX ? Assets.imagesX : Assets.imagesO,
                          width: 40.w,
                          height: 40.h,
                        );

                        isX = !isX;
                        setState(() {});
                      }
                    : null,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: widgets[2],
                ),
              ),

              /// 4
              GestureDetector(
                onTap: widgets[3] == null && !isGameOver
                    ? () {
                        isX ? xPositions += '4' : oPositions += '4';
                        checkWinning(winningPositions, isX ? xPositions : oPositions);
                        widgets[3] = Image.asset(
                          isX ? Assets.imagesX : Assets.imagesO,
                          width: 40.w,
                          height: 40.h,
                        );
                        isX = !isX;
                        setState(() {});
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      top: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                      bottom: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: widgets[3],
                ),
              ),

              /// 5
              GestureDetector(
                onTap: widgets[4] == null && !isGameOver
                    ? () {
                        isX ? xPositions += '5' : oPositions += '5';
                        checkWinning(winningPositions, isX ? xPositions : oPositions);
                        widgets[4] = Image.asset(
                          isX ? Assets.imagesX : Assets.imagesO,
                          width: 40.w,
                          height: 40.h,
                        );
                        isX = !isX;
                        setState(() {});
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      top: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                      bottom: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                      left: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                      right: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: widgets[4],
                ),
              ),

              /// 6
              GestureDetector(
                onTap: widgets[5] == null && !isGameOver
                    ? () {
                        isX ? xPositions += '6' : oPositions += '6';
                        checkWinning(winningPositions, isX ? xPositions : oPositions);
                        widgets[5] = Image.asset(
                          isX ? Assets.imagesX : Assets.imagesO,
                          width: 40.w,
                          height: 40.h,
                        );
                        isX = !isX;
                        setState(() {});
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      top: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                      bottom: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: widgets[5],
                ),
              ),

              /// 7
              GestureDetector(
                onTap: widgets[6] == null && !isGameOver
                    ? () {
                        isX ? xPositions += '7' : oPositions += '7';
                        checkWinning(winningPositions, isX ? xPositions : oPositions);
                        widgets[6] = Image.asset(
                          isX ? Assets.imagesX : Assets.imagesO,
                          width: 40.w,
                          height: 40.h,
                        );
                        isX = !isX;
                        setState(() {});
                      }
                    : null,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: widgets[6],
                ),
              ),

              /// 8
              GestureDetector(
                onTap: widgets[7] == null && !isGameOver
                    ? () {
                        isX ? xPositions += '8' : oPositions += '8';
                        checkWinning(winningPositions, isX ? xPositions : oPositions);
                        widgets[7] = Image.asset(
                          isX ? Assets.imagesX : Assets.imagesO,
                          width: 40.w,
                          height: 40.h,
                        );
                        isX = !isX;
                        setState(() {});
                      }
                    : null,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border(
                      right: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                      left: BorderSide(
                          color: const Color(0xffc7c594), width: 2.w),
                    ),
                  ),
                  alignment: Alignment.center,
                  child: widgets[7],
                ),
              ),

              /// 9
              GestureDetector(
                onTap: widgets[8] == null && !isGameOver
                    ? () {
                        isX ? xPositions += '9' : oPositions += '9';
                        checkWinning(winningPositions, isX ? xPositions : oPositions);
                        widgets[8] = Image.asset(
                          isX ? Assets.imagesX : Assets.imagesO,
                          width: 40.w,
                          height: 40.h,
                        );
                        isX = !isX;
                        setState(() {});
                      }
                    : null,
                child: Container(
                  alignment: Alignment.center,
                  color: Colors.transparent,
                  child: widgets[8],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

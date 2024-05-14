import 'package:flutter/material.dart';
import 'package:flutter_day_15/models/expense.dart';
import 'package:flutter_day_15/pages/expenses/add_widget.dart';
import 'package:flutter_day_15/pages/homework/tic_tac_toe.dart';
import 'package:flutter_day_15/pages/homework/widgets/welcome.dart';
import 'package:flutter_day_15/repository/repository.dart';
import 'package:flutter_day_15/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const ScreenUtilInit(
      designSize: Size(375, 812),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  DateTime date = DateTime.now();

  final ExpenseRepository expenseRepository = ExpenseRepository();

  @override
  Widget build(BuildContext context) {
    double sum = expenseRepository.expenses
        .fold(0, (previousValue, element) => previousValue + element.amount);

    var filteredExpense =
        expenseRepository.expenses.where((element) => element.date.year == date.year && element.date.month == date.month && element.date.day == date.day).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text(
          'Mening Hamyonim',
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                backgroundColor: Colors.white,
                context: context,
                builder: (context) {
                  return AddWidget(expenseRepository: expenseRepository);
                },
              );
            },
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: SizedBox(
        width: 375.w,
        height: 812.h,
        child: Stack(
          children: [
            Positioned(
              top: 0,
              child: Container(
                height: 200.h,
                width: 375.w,
                decoration: const BoxDecoration(color: Colors.white),
                child: Column(
                  children: [
                    20.height,
                    TextButton(
                      onPressed: () async {
                        DateTime? pickedDate = await showDatePicker(
                          context: context,
                          firstDate: DateTime(2023),
                          lastDate: DateTime(2025),
                          initialDate: date,
                        );
                        date = pickedDate!;
                        setState(() {});
                      },
                      child: Text(
                        DateFormat("MMMM d, yyyy").format(date),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                    30.height,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                date = DateTime(date.year,date.month-1,date.day);
                              });
                            },
                            icon: const Icon(Icons.arrow_back_ios_new)),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              '$sum'.formatPrice(),
                              style: TextStyle(
                                  fontSize: 40.sp, fontWeight: FontWeight.w700),
                            ),
                            const Text("so'm")
                          ],
                        ),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                date = DateTime(date.year,date.month+1,date.day);
                              });
                            },
                            icon: const Icon(Icons.arrow_forward_ios_rounded)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const MonthlyBudget(summa: 1526000, rasxot: 26000),
            Positioned(
              bottom: 0,
              child: Container(
                height: 410,
                width: 375.w,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.r),
                        topLeft: Radius.circular(30.r))),
                child: ListView.builder(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
                  shrinkWrap: true,
                  primary: true,
                  itemCount: filteredExpense.length,
                  itemBuilder: (context, index) {
                    return ExpenseWidget(
                      title: filteredExpense[index].title,
                      amount: filteredExpense[index].amount,
                      date: filteredExpense[index].date,
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ExpenseWidget extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  const ExpenseWidget({
    super.key,
    required this.title,
    required this.amount,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300,
                  ),
                  child: const Icon(
                    Icons.alarm,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      DateFormat("MMMM d, yyyy").format(date),
                      style: const TextStyle(color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            Text(
              "${amount.toStringAsFixed(0).formatPrice()} so'm",
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
class MonthlyBudget extends StatefulWidget {
  final double summa;
  final double rasxot;

  const MonthlyBudget({super.key, required this.summa, required this.rasxot});

  @override
  State<MonthlyBudget> createState() => _MonthlyBudgetState();
}

class _MonthlyBudgetState extends State<MonthlyBudget> {
  double natija(double summa, double rasxot) {
    double res = (rasxot * 100) / summa;
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 230.h,
      child: Container(
        padding: const EdgeInsets.all(20),
        width: 375.w,
        height: 110.h,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30), topRight: Radius.circular(30)),
            color: Color(0xffEEEFFB)),
        child: Column(
          children: [
            Row(
              children: [
                const Text("Oylik byudjet:  "),
                Icon(
                  Icons.edit,
                  color: const Color(0xff5698C3),
                  size: 18.sp,
                ),
                SizedBox(width: 5.w),
                ZoomTapAnimation(
                  onTap: () {
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const Placeholder();
                          },
                        ),
                      );
                    });
                  },
                  child: Row(
                    children: [
                      Text(
                        widget.summa
                            .toString()
                            .formatPrice(),
                        style: const TextStyle(
                          color: Color(0xff5698C3),
                        ),
                      ),
                      SizedBox(width: 5.w),
                      const Text(
                        "so'm",
                        style: TextStyle(
                          color: Color(0xff5698C3),
                        ),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                Text("${natija(widget.summa, widget.rasxot).toStringAsFixed(1)}%"),
              ],
            ),
            SizedBox(height: 20.h),
            Stack(
              children: [
                Positioned(
                  child: Container(
                    height: 4.h,
                    width: 1.sw,
                    decoration: const BoxDecoration(
                      color: Color(0xffD7DEEB),
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 4.h,
                    width: (natija(widget.summa, widget.rasxot) / 100).sw,
                    decoration: const BoxDecoration(
                      color: Color(0xff3E9FEB),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
  String dateTime = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[600],
        title: const Text(
          "Mening hamyonim",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 30),
            TextButton(
              onPressed: () async {
                DateTime? date = await showDatePicker(
                  context: context,
                  firstDate: DateTime(2023),
                  lastDate: DateTime(2025),
                  initialDate: DateTime.now(),
                );
                print(date);
                dateTime = "Month: ${date?.month}, Year: ${date?.year}";
                setState(() {});
              },
              child: Text(
                dateTime,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
            // PricePage(),
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  child: Container(
                    width: double.infinity,
                    height: 280,
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(40),
                      ),
                    ),
                  ),
                  // Sarı konteyner
                ),
              ],
            ),
            const Stack()
          ],
        ),
      ),
    );
  }
}

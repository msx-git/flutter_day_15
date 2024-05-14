import 'package:flutter/material.dart';
import 'package:flutter_day_15/utils/extensions.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

import '../../models/expense.dart';
import '../../repository/repository.dart';

class AddWidget extends StatefulWidget {
  const AddWidget({super.key, required this.expenseRepository});
  final ExpenseRepository expenseRepository;

  @override
  State<AddWidget> createState() => _AddWidgetState();
}

class _AddWidgetState extends State<AddWidget> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime date2 = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.height,
          const Text("Harajat qo'shish"),
          TextField(
            controller: titleController,
            decoration:
            const InputDecoration(hintText: 'Harajat nomi'),
          ),
          20.height,
          TextField(
            controller: amountController,
            decoration: const InputDecoration(
                hintText: 'Harajat qiymati'),
            keyboardType: TextInputType.number,
          ),
          20.height,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: () async {
                  showDatePicker(
                      context: context,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      currentDate: DateTime.now())
                      .then((value) {
                    setState(() {
                      date2 = value!;
                    });
                  });
                },
                child: const Text('Sana tanlash'),
              ),
              Text(DateFormat("MMMM d, yyyy").format(date2)),
            ],
          ),
          40.height,
          FilledButton(
            onPressed: () {
              widget.expenseRepository.addExpense(
                Expense(
                  title: titleController.text,
                  amount: double.parse(amountController.text),
                  date: date2,
                ),
              );
              titleController.clear();
              amountController.clear();
              Navigator.pop(context);
              setState(() {});
            },
            child: const Text("Qo'shish"),
          )
        ],
      ),
    );
  }
}

import '../models/expense.dart';

class ExpenseRepository {
  List<Expense> expenses = [
    Expense(title: "Expense - 1", amount: 250, date: DateTime(2024,5,13)),
    Expense(title: "Expense - 2", amount: 6500, date: DateTime.now()),
    Expense(title: "Expense - 3", amount: 1400, date: DateTime.now()),
    Expense(title: "Expense - 4", amount: 750, date: DateTime(2024,5,15)),
    Expense(title: "Expense - 5", amount: 750, date: DateTime(2024,4,15)),
    Expense(title: "Expense - 6", amount: 750, date: DateTime(2024,6,15)),
    Expense(title: "Expense - 7", amount: 750, date: DateTime(2024,3,15)),
    Expense(title: "Expense - 8", amount: 750, date: DateTime(2024,7,15)),
  ];

  void addExpense(Expense expense){
    expenses.add(expense);
  }

}

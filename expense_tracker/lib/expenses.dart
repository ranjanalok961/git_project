import 'package:expense_tracker/chart.dart';
import 'package:expense_tracker/expenselist.dart';
import 'package:expense_tracker/newexpense.dart';
import 'package:flutter/material.dart';

import 'Model/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> list = [
    Expense(
        category: Category.food,
        title: 'PannerRice',
        amount: 90,
        date: DateTime.now()),
    Expense(
        category: Category.travel,
        title: 'Auto',
        amount: 40,
        date: DateTime.now()),
    Expense(
        category: Category.work,
        title: 'FlutterCourse',
        amount: 100,
        date: DateTime.now())
  ];
  void addExpense(Expense expense) {
    setState(() {
      list.add(expense);
    });
  }

  void removeExpense(Expense expense) {
    final expenseIndex = list.indexOf(expense);
    setState(() {
      list.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              list.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  void model() {
    showModalBottomSheet(
        useSafeArea: true,
        isScrollControlled: true,
        context: context,
        builder: (ctx) {
          return Newexpense(AddExpense: addExpense);
        });
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    print(width);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Flutter Expense Tracker',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
                onPressed: () {
                  model();
                },
                icon: const Icon(
                  Icons.add,
                  color: Colors.white,
                ))
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: width < 420 ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(child: Chart(expenses: list)),
              Expanded(
                  child: Expenselist(expenselist: list, remove: removeExpense))
            ],
          ):Row(
            children: [
              Expanded(child: Chart(expenses: list)),
              Expanded(
                  child: Expenselist(expenselist: list, remove: removeExpense))
            ],
          )
        ),
      ),
    );
  }
}

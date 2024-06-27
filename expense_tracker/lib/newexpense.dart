import 'package:expense_tracker/Model/expense.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Newexpense extends StatefulWidget {
  Newexpense({super.key, required this.AddExpense});
  void Function(Expense expense) AddExpense;
  @override
  State<Newexpense> createState() => _NewexpenseState();
}

class _NewexpenseState extends State<Newexpense> {
  var titleController = TextEditingController();
  var amountController = TextEditingController();
  Category? selectedCategory;
  DateTime? selected;
  @override
  void dispose() {
    titleController.dispose();
    amountController.dispose();
    super.dispose();
  }

  void onSubmit() {
    if (titleController.text.trim().isEmpty) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: const Text("Enter valid title!"),
            actions: <Widget>[
              TextButton(
                child: const Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    final amount = double.tryParse(amountController.text) ?? 0.0;
    widget.AddExpense(Expense(
        category: selectedCategory!,
        title: titleController.text,
        amount: amount,
        date: selected!));
    Navigator.pop(context);
  }

  Future<void> showdatepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1, now.month, now.day);
    final pickedDate = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: firstDate,
        lastDate: now);
    setState(() {
      selected = pickedDate;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: titleController,
            maxLength: 50,
            decoration: const InputDecoration(label: Text('Title')),
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: amountController,
                  maxLength: 50,
                  decoration: const InputDecoration(label: Text('Amount')),
                ),
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Spacer(),
                  Text(selected == null
                      ? "Select Date"
                      : DateFormat('yyyy-MM-dd').format(selected!)),
                  IconButton(
                      onPressed: () {
                        showdatepicker();
                      },
                      icon: Icon(Icons.calendar_month))
                ],
              ))
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DropdownButton(
                  hint: const Text('Select Category'),
                  value: selectedCategory,
                  items: Category.values.map((item) {
                    return DropdownMenuItem(
                        value: item, child: Text(item.name));
                  }).toList(),
                  onChanged: (Category? value) {
                    setState(() {
                      selectedCategory = value;
                    });
                  }),
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  ElevatedButton(
                      onPressed: () {
                        onSubmit();
                        // print(DateFormat('yyyy-MM-dd').format(selected!));
                      },
                      child: Text('Submit'))
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}

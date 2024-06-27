import 'package:expense_tracker/Model/expense.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class Expenselist extends StatelessWidget {
  Expenselist(
      {super.key,
      required this.expenselist,
      required void Function(Expense expense) this.remove});
  void Function(Expense expense) remove;
  final List<Expense> expenselist;
  @override
  Widget build(BuildContext context) {
    return  expenselist.isEmpty ? const Center(child: Text('No Expense Found'),):ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: ValueKey(expenselist[index]),
              onDismissed: (direction) => {remove(expenselist[index])},
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, right: 20, top: 10, bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(expenselist[index].title),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('${expenselist[index].amount}'),
                          Row(
                            children: [
                              Icon(categoryIcon[expenselist[index].category]),
                              const SizedBox(
                                width: 8,
                              ),
                              Text(DateFormat('yyyy-MM-dd')
                                  .format(expenselist[index].date))
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ));
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 10,
            ),
        itemCount: expenselist.length);
  }
}

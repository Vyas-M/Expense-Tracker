import 'dart:math';

import 'package:expense_tracker_v_2/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker_v_2/widgets/new_expense.dart';
import 'package:flutter/material.dart';

import '../models/expense.dart';

class Expenses extends StatefulWidget {
  const Expenses({Key? key}) : super(key: key);

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    final expenseIndex = _registeredExpenses.indexOf(expense);
    setState(() {
      _registeredExpenses.remove(expense);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
          content: Text('Deleted Successfully'),
          duration: Duration(seconds: 2),
          action: SnackBarAction(
            onPressed: () {
              setState(() {
                _registeredExpenses.insert(expenseIndex, expense);
              });
            },
            label: 'Undo',
          )),
    );
  }

  void _openAddExpenseOverLay() {
    showModalBottomSheet(
      context: context,
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
      isScrollControlled: true,
    );
  }

  final List<Expense> _registeredExpenses = [
    Expense(
        title: 'Flutter Course',
        amount: 20.0,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Data Course',
        amount: 40.0,
        date: DateTime.now(),
        category: Category.work),
    Expense(
        title: 'Movie',
        amount: 69,
        date: DateTime.now(),
        category: Category.leisure),
  ];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = Center(
      child: Text("Start adding Expenses."),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
          expenses: _registeredExpenses, onRemoveExpense: _removeExpense);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Expense Tracker"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: _openAddExpenseOverLay,
          ),
        ],
      ),
      body: Column(
        children: [
          Text("The chart goes here"),
          Expanded(child: mainContent),
        ],
      ),
    );
  }
}

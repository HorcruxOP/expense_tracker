import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExpenseTile extends StatelessWidget {
  final String name, amount;
  final DateTime dateTime;
  final void Function(BuildContext)? deleteTapped;
  const ExpenseTile({
    super.key,
    required this.name,
    required this.amount,
    required this.dateTime,
    this.deleteTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(
        motion: const StretchMotion(),
        children: [
          SlidableAction(
            onPressed: deleteTapped,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(4),
          ),
        ],
      ),
      child: ListTile(
        title: Text(
          name,
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          "${dateTime.day}/${dateTime.month}/${dateTime.year}",
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        trailing: Text(
          "\$$amount",
          style: const TextStyle(
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

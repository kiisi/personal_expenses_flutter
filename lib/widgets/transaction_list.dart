import 'package:app/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:app/widgets/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function(String)? deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return transactions.isEmpty
        ? LayoutBuilder(builder: (context, constraints) {
            return Column(children: [
              Text('No transactions added yet',
                  style: Theme.of(context).textTheme.titleSmall),
              SizedBox(height: 20),
              Container(
                height: constraints.maxHeight * 0.6,
                child:
                    Image.asset('assets/images/waiting.png', fit: BoxFit.cover),
              ),
            ]);
          })
        : ListView(
            children: transactions
                .map((tx) => TransactionItem(
                    key: ValueKey(tx.id), transaction: tx, deleteTx: deleteTx))
                .toList(),
          );
  }
}

//ListView.builder has key issues in identifying widgets uniquely
//
// ListView.builder(
//             itemBuilder: (context, index) {
//               return TransactionItem(
//                   key: ValueKey(transactions[index].id),
//                   transaction: transactions[index],
//                   deleteTx: deleteTx);
//             },
//             itemCount: transactions.length,
//           );
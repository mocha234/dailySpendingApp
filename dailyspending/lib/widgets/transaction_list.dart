import 'dart:ui';

import 'package:dailyspending/models/transaction.dart';
import 'package:flutter/material.dart ';
import 'package:intl/intl.dart';
//import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTx;

  TransactionList(this.transactions, this.deleteTx);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      child: transactions.isEmpty
          ? Column(
              children: [
                Text(
                  "No Transaction yet",
                  style: Theme.of(context).textTheme.headline6,
                ),
                SizedBox(
                  height: 100,
                ),
                Container(
                  height: 200,
                  child: Image.asset(
                    "assets/images/waiting.png",
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                        padding: const EdgeInsets.all(6.0),
                        child: FittedBox(
                            child: Text("\$${transactions[index].amount}")),
                      ),
                    ),
                    title: Text(
                      transactions[index].title,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    subtitle: Text(
                        DateFormat.yMMMd().format(transactions[index].date)),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      color: Theme.of(context).errorColor,
                      onPressed: () => deleteTx(transactions[index].id),
                    ),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}

// Card(
//                   child: Row(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(5),
//                         padding: EdgeInsets.all(5),
//                         decoration: BoxDecoration(
//                             border: Border.all(
//                           color: Theme.of(context).primaryColor,
//                           style: BorderStyle.solid,
//                         )),
//                         child: Text(
//                           "\$${transactions[index].amount.toStringAsFixed(2)}", //String interpolation: "${}"
//                           //don't need toString() as already in String)
//                           style: Theme.of(context).textTheme.bodyText1,
//                         ),
//                       ),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             transactions[index].title,
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           Text(
//                             DateFormat.yMMMMd()
//                                 .format(transactions[index].date),
//                             style: TextStyle(color: Colors.grey),
//                           )
//                         ],
//                       )
//                     ],
//                   ),
//                 );

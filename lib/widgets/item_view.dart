 import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/catelog.dart';

class ItemView extends StatelessWidget {
  final Item item;
  const ItemView({super.key, required this.item}) : assert (item != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.network(item.image),
        title: Text(item.name),
        subtitle: Text(item.desc),
        trailing: Text(
            "\$${item.price}",
          textScaler: TextScaler.linear(1.5),
          style: TextStyle(fontWeight: FontWeight.bold, ),
        ),
      ),
    );
  }
}


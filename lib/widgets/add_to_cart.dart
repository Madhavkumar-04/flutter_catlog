import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_catlog/core/store.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cart.dart';
import '../models/catelog.dart';

class AddToCart extends StatelessWidget {
  final Item catalogue;
  AddToCart({
    super.key, required this.catalogue,
  });
  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [AddMutation, RemoveMutation]);
    final _cart = (VxState.store as MyStore).cart;
    bool isInCart = _cart.items.contains(catalogue) ?? false;

    return ElevatedButton(
        onPressed: () {
          if(!isInCart) {
            AddMutation(catalogue);
          }
        },
        style: ButtonStyle(
          backgroundColor:MaterialStateProperty.all(context.theme.highlightColor),
          shape: MaterialStateProperty.all(StadiumBorder()),
        ),
        child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus)
    );
  }
}

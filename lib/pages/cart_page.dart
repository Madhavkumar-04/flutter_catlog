import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';

import '../core/store.dart';
class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.canvasColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: "Cart".text.bold.make()
      ),
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _cartTotal(),
        ],
      ),
    );
  }
}

class _cartTotal extends StatelessWidget {
  // const _cartTotal({super.key});

  @override
  Widget build(BuildContext context) {
    final _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      height: 200,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal, // Allow horizontal scrolling
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            VxConsumer(
              notifications: {},
              mutations: {RemoveMutation},
              builder: (context,state, VxStatus? status) {
                return _cart.totalPrice.text.xl.color(context.theme.focusColor).make();
              },
            ),
            30.widthBox,
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(context.theme.highlightColor)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: "Buy Not Supported Yet!!!".text.make(),
                ));
              },
              child: 'Buy'.text.make(),
            ).w32(context),
          ],
        ),
      ),
    );

  }
}

class _CartList extends StatelessWidget {
  _CartList({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    VxState.watch(context, on: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;
    return _cart.items.isEmpty
        ? "Nothing to show.".text.xl3.makeCentered()
        :  ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context, index)=> ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            onPressed: (){
              RemoveMutation(_cart.items[index]);
              // _cart.remove(_cart.items[index]);
              // setState(() {});
            },
              icon: Icon(Icons.remove_circle_outline)
          ),
          title: _cart.items[index].name.text.make(),
        )
    ).p16();
  }
}



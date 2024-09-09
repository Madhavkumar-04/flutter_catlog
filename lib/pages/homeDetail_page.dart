import 'package:flutter/material.dart';
import 'package:flutter_catlog/widgets/add_to_cart.dart';
import 'package:flutter_catlog/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import '../models/catelog.dart';

class HomedetailPage extends StatelessWidget {
  final Item catelog;
  const HomedetailPage({super.key, required this.catelog});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catelog.price}".text.bold.xl3.red500.make(),
            AddToCart(catalogue: catelog,)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                tag: Key(catelog.id.toString()),
                child: Image.network(catelog.image).p16()
            ).h40(context),
            Expanded(
                child: VxArc(
                  height: 30.0,
                  edge: VxEdge.top,
                  arcType: VxArcType.convey,
                  child: Container(
                    color:context.cardColor,
                    width: context.screenWidth,
                    child: Column(
                      children: [
                        catelog.name.text.xl4.color(context.theme.focusColor).bold.make(),
                        catelog.desc.text.textStyle(context.captionStyle!).make(),
                        ]
                    ).p64(),
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}


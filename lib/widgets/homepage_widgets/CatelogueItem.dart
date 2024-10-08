import 'package:flutter/material.dart';
import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/widgets/add_to_cart.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catelog.dart';
import '../../widgets/themes.dart';
import 'CatalogueImage.dart';

class CatelogueItem extends StatelessWidget {
  final Item catalogue;
  const CatelogueItem({super.key, required this.catalogue});

  @override
  Widget build(BuildContext context) {
    var children2 = [
          Hero(
            tag: Key(catalogue.id.toString()),
              child: CatalogueImage(
                  image: catalogue.image
               )
          ),
          Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  catalogue.name.text.lg.color(context.theme.focusColor).bold.make(),
                  catalogue.desc.text.textStyle(context.captionStyle!).make(),
                  10.heightBox,
                  ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalogue.price}".text.bold.xl.make(),
                      AddToCart(catalogue: catalogue,)
                    ],
                  ).pOnly(right: 4.0)
                ],
              ).p(context.isMobile ? 0: 16)
          )
        ];
    return VxBox(
      child: context.isMobile ? Row(
        children: children2,
      ):
      Column(
        children: children2,
      ),
    ).color(context.cardColor).rounded.square(150).make().p16();
  }
}


import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../widgets/themes.dart';

class CatelogeHeader extends StatelessWidget {
  const CatelogeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        "Catelogue App".text.xl4.color(context.theme.focusColor).make(),
        "Trending Products".text.xl2.color(MyTheme.blueish).make()
      ],
    );
  }
}


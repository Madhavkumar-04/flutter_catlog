import 'package:flutter/material.dart';
import 'package:flutter_catlog/pages/homeDetail_page.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../models/catelog.dart';
import 'CatelogueItem.dart';

class CatelogueList extends StatelessWidget {

  const CatelogueList({super.key});

  @override
  Widget build(BuildContext context) {
    return !context.isMobile ? GridView.builder(
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2, crossAxisSpacing: 20),
      itemCount: Catelogue.item.length,
      itemBuilder: (context, index) {
        final catalogue = Catelogue.item[index];
        return InkWell(
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context)=>HomedetailPage(catelog:catalogue)
                )
            ),
            child: CatelogueItem(catalogue: catalogue)
        );
      },
    ) :
    ListView.builder(
      shrinkWrap: true,
      itemCount: Catelogue.item.length,
      itemBuilder: (context, index) {
        final catalogue = Catelogue.item[index];
        return InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context)=>HomedetailPage(catelog:catalogue)
              )
          ),
            child: CatelogueItem(catalogue: catalogue)
        );
      },
    );
  }
}


import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_catlog/models/catelog.dart";
import "package:flutter_catlog/widgets/drawer.dart";
import "dart:convert";
import "../widgets/item_view.dart";
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  initState()  {
    // TODO: implement initState
    super.initState();
    loadState();
  }
  loadState() async {
    final catlogJson = await rootBundle.loadString("files/catelog.json");
    final decodeData = jsonDecode(catlogJson);
    var productData = decodeData["products"];
    Catelogue.item = List.from(productData)
        .map<Item>((item)=>Item.fromMap(item))
        .toList();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    // var dummyList = List.generate(50, (index)=> Catelogue.item[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Catelogue.item.isNotEmpty ? ListView.builder(
          itemCount: Catelogue.item.length,
          itemBuilder: (BuildContext context, int index) {
            return ItemView(
              item: Catelogue.item[index],
            );
          },
        ):
            Center(
              child: CircularProgressIndicator(),
            )
      ),
      drawer: CustomDrawer(),
    );
  }
}

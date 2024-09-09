import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/services.dart";
import "package:flutter_catlog/core/store.dart";
import "package:flutter_catlog/models/cart.dart";
import "package:flutter_catlog/models/catelog.dart";
import "package:flutter_catlog/utils/routes.dart";
import "package:flutter_catlog/widgets/drawer.dart";
import "package:flutter_catlog/widgets/themes.dart";
import "dart:convert";
import "../widgets/homepage_widgets/CatelogeHeader.dart";
import "../widgets/homepage_widgets/CatelogueList.dart";
import "../widgets/item_view.dart";
import 'package:velocity_x/velocity_x.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final url = "https://api.jsonbin.io/v3/b/66de8c4bad19ca34f8a213f8";
  @override
  initState()  {
    // TODO: implement initState
    super.initState();
    loadState();
  }
  loadState() async {
    // final catlogJson = await rootBundle.loadString("assets/files/catelog.json");
    final response = await http.get(Uri.parse(url));
    final catlogJson = await response.body;

    final decodeData = jsonDecode(catlogJson);
    print(decodeData);
    var productData = decodeData['record']["products"];
    Catelogue.item = List.from(productData)
        .map<Item>((item)=>Item.fromMap(item))
        .toList();
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;
    // var dummyList = List.generate(50, (index)=> Catelogue.item[0]);
    return Scaffold(
      backgroundColor: context.canvasColor,
      floatingActionButton: VxBuilder(
        mutations: {AddMutation, RemoveMutation},
        builder : (context,state, status) {
          return FloatingActionButton(

            backgroundColor: context.theme.highlightColor,
            onPressed: () => Navigator.pushNamed(context, MyRoutes.cartPage),

            child: const Icon(CupertinoIcons.cart, color: Colors.white,),
          ).badge(color: Vx.red50, size: 20, count: _cart.items.length, textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ));
        }
      ),
      body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              children: [
                CatelogeHeader(),
                if(Catelogue.item.isNotEmpty)
                  CatelogueList().py12().expand()
                else
                  CircularProgressIndicator().centered().expand()
              ],
            ),
          )
      ),
    );
  }
}




import 'package:flutter_catlog/models/cart.dart';
import 'package:flutter_catlog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';

class MyStore extends VxStore{
  late CartModel cart;
  late Catelogue catelog;

  MyStore(){
    cart = CartModel();
    catelog = Catelogue();
    cart.catalogue = catelog;
  }
}
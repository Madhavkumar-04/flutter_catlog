import 'package:flutter_catlog/core/store.dart';
import 'package:flutter_catlog/models/catelog.dart';
import 'package:velocity_x/velocity_x.dart';
class CartModel {
//catalogue field
  Catelogue? _catalogue;

//collection of IDs - store IDs of each item
  final List<num> _itemIds = [];

  // Get Catalogue
  Catelogue get catalogue => _catalogue!;

  set catalogue(Catelogue newCatalogue) {
    _catalogue = newCatalogue;
  }

  //Get items in the cart
  List<Item> get items =>
      _itemIds.map((id) => _catalogue!.getById(id)).toList();

  //Get total price
  num get totalPrice =>
      items.fold(0, (total, current) => total + current.price);

  // //Add Item
  // void add(Item item) {
  //   _itemIds.add(item.id);
  // }

  //Remove Item
  void remove(Item item) {
    _itemIds.remove(item.id);
  }
}

class AddMutation extends VxMutation<MyStore>{
  final Item item;

  AddMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.add(item.id);
  }

}

class RemoveMutation extends VxMutation<MyStore>{
  final Item item;

  RemoveMutation(this.item);
  @override
  perform() {
    store?.cart._itemIds.remove(item.id);
  }

}
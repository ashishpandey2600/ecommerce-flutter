import '../product/product_model.dart';

class CartItemModel {
  ProductModel? product;
  String? sId;
  int? quantity;

  CartItemModel({this.sId, this.quantity});

  CartItemModel.fromJson(Map<String, dynamic> json) {
    product = ProductModel.fromJson(json["product"]);
    sId = json['_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product'] = product!.sId;
    data['_id'] = this.sId;
    data['quantity'] = this.quantity;
    return data;
  }
}

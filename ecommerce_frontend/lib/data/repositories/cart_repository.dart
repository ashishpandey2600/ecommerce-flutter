import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ecommerce_frontend/data/models/cart/cart_item_model.dart';

import '../../core/api.dart';

class CartRepository {
  final _api = API();

  Future<List<CartItemModel>> fetchCartForUser(String userId) async {
    try {
      Response response = await _api.sendRequest.get("/cart/$userId");
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      //Convert raw data to model
      return (apiResponse.data as List<dynamic>)
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartItemModel>> addToCart(
      CartItemModel cartItem, String userId) async {
    try {
      Map<String, dynamic> data = cartItem.toJson();
      data["user"] = userId;

      Response response =
          await _api.sendRequest.delete("/cart", data: jsonEncode(data));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      //Convert raw data to model
      return (apiResponse.data as List<dynamic>)
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }

  Future<List<CartItemModel>> removeFromCart(productId, String userId) async {
    try {
      Map<String, dynamic> data = {
        "user" : userId,
        "product" : productId,
      };

      Response response =
          await _api.sendRequest.post("/cart", data: jsonEncode(data));

      ApiResponse apiResponse = ApiResponse.fromResponse(response);
      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }
      //Convert raw data to model
      return (apiResponse.data as List<dynamic>)
          .map((json) => CartItemModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}

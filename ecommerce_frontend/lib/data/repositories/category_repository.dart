
import 'package:dio/dio.dart';
import 'package:ecommerce_frontend/core/api.dart';
import 'package:ecommerce_frontend/data/models/category/category_model.dart';


class CategoryRepository {
  final _api = API();

  Future<List<CategoryModel>> fetchAllCategories() async {
    try {
      Response response = await _api.sendRequest.get("/category");
      ApiResponse apiResponse = ApiResponse.fromResponse(response);

      if (!apiResponse.success) {
        throw apiResponse.message.toString();
      }

      //Convert raw data to model
      return (apiResponse.data as List<dynamic>)
          .map((json) => CategoryModel.fromJson(json))
          .toList();
    } catch (ex) {
      rethrow;
    }
  }
}

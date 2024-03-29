
import 'package:ecommerce_frontend/data/models/category/category_model.dart';
import 'package:flutter/foundation.dart';

abstract class CategoryState {
  final List<CategoryModel> categories;
  CategoryState(this.categories);
}

class CategoryInitialState extends CategoryState {
  CategoryInitialState() : super([]);
}

class CategoriLoadingState extends CategoryState {
  CategoriLoadingState(super.categories);
}

class CategoryLoadedState extends CategoryState {
  CategoryLoadedState(super.categories);
}

class CategoryErrorState extends CategoryState {
  final String message;
  CategoryErrorState(this.message, super.categories);
}

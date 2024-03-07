import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/data/models/product/product_model.dart';
import 'package:ecommerce_frontend/logic/services/fomatter.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:ecommerce_frontend/presentation/widgets/primarybutton.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final ProductModel productModel;
  const ProductDetailsScreen({super.key, required this.productModel});
  static const routeName = "product_details";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.productModel.title}"),
      ),
      body: SafeArea(
          child: ListView(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width,
            child: CarouselSlider.builder(
              itemCount: widget.productModel.images?.length ?? 0,
              slideBuilder: (index) {
                String url = widget.productModel.images![index];
                log(url);
                return CachedNetworkImage(imageUrl: url);
              },
            ),
          ),
          const GapWidget(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.productModel.title}",
                  style: const TextStyle(
                      fontSize: 29, fontWeight: FontWeight.bold),
                ),
                Text(
                  Formatter.formatPrice(widget.productModel.price!),
                  style: const TextStyle(
                      fontSize: 19, fontWeight: FontWeight.bold),
                ),
                const GapWidget(),
                PrimaryButton(
                  text: "Add to Cart",
                  onpressed: () {},
                ),
                const GapWidget(),
                Text(
                  "Description",
                  style: TextStyles.body2.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  " widget.productModel.description.toString()",
                  style: TextStyles.body1.copyWith(fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      )),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_frontend/core/ui.dart';
import 'package:ecommerce_frontend/logic/cubits/product_cubit/product_cubit.dart';
import 'package:ecommerce_frontend/logic/cubits/product_cubit/product_state.dart';
import 'package:ecommerce_frontend/logic/services/fomatter.dart';
import 'package:ecommerce_frontend/presentation/screens/product/product_details_screen.dart';
import 'package:ecommerce_frontend/presentation/widgets/gap_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserFeedScreen extends StatefulWidget {
  const UserFeedScreen({super.key});

  @override
  State<UserFeedScreen> createState() => _UserFeedScreenState();
}

class _UserFeedScreenState extends State<UserFeedScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductCubit, ProductState>(
      builder: (context, state) {
        if (state is ProductLoadingState && state.products.isEmpty) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ProductErrorState && state.products.isEmpty) {
          return Center(
            child: Text("${state.message.toString()}"),
          );
        }

        return ListView.builder(
            itemCount: state.products.length,
            itemBuilder: (context, index) {
              final products = state.products[index];
              return CupertinoButton(
                onPressed: () {
                  Navigator.pushNamed(context, ProductDetailsScreen.routeName,
                      arguments: products);
                },
                child: Row(
                  children: [
                    CachedNetworkImage(
                      width: MediaQuery.of(context).size.width / 3,
                      imageUrl:
                          "https://designwanted.com/wp-content/uploads/2022/12/The-future-of-product-design-%E2%80%93-how-artificial-intelligence-is-changing-the-game-cover.jpg",
                    ), //products.image?[0]
                    GapWidget(),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GapWidget(),
                          Text(
                            products.title.toString(),
                            style: TextStyles.body1
                                .copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${products.description.toString()} alkjsdhfkljhasdkjfksjdhfkl",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style:
                                TextStyles.body2.copyWith(color: Colors.black),
                          ),
                          GapWidget(),
                          Text(
                            "${Formatter.formatPrice(products.price!)}",
                            style: TextStyles.heading3,
                          ),
                        ],
                      ),
                    ),
                    Icon(CupertinoIcons.cart_fill)
                  ],
                ),
              );
            });
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/home/components/product_card.dart';
import 'package:store_app/screens/home/components/section_title.dart';

class Popular extends StatelessWidget {
  const Popular({
    super.key, required this.popularProducts,
  });

  final List<ProductModel> popularProducts;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "Popular",
          press: (){},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
              //List product
              List.generate(
                popularProducts.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: defaultPadding),
                  child: ProductCard(
                    image: popularProducts[index].image,
                    press: (){},
                    title: popularProducts[index].title,
                    price: popularProducts[index].price,
                  ),
                ),
              ),
          ),
        )
      ],
    );
  }
}
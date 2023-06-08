import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/details/details_screen.dart';
import 'package:store_app/screens/home/components/section_title.dart';
import 'package:store_app/screens/home/components/product_card.dart';

class NewArrival extends StatelessWidget {
  const NewArrival({
    super.key, required this.newArrivalProducts,
  });

  final List<ProductModel> newArrivalProducts;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SectionTitle(
          title: "New Arrival",
          press: (){},
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: 
              //List product
              List.generate(
                newArrivalProducts.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(left: defaultPadding),
                  child: ProductCard(
                    image: newArrivalProducts[index].image,
                    press: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsScreen(product: newArrivalProducts[index],)));
                    },
                    title: newArrivalProducts[index].title,
                    price: newArrivalProducts[index].price,
                  ),
                ),
              ),
          ),
        )
      ],
    );
  }
}
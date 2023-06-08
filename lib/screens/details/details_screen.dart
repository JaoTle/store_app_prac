import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/product_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.product});

  final ProductModel product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEFEFF2),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.black),
        actions: [
          IconButton(
            onPressed: (){},
            icon: CircleAvatar(
              child: SvgPicture.asset("assets/icons/Heart.svg",),
              backgroundColor: Colors.white,
            )
          )
        ],
      ),
      body: Column(
        children: [
          Image.network(
            product.image,
            height: MediaQuery.of(context).size.height*0.4,
            fit: BoxFit.cover,
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(defaultPadding, defaultPadding*2, defaultPadding, defaultPadding),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(defaultBorderRadius * 3))
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(product.title,style: Theme.of(context).textTheme.headline6,overflow: TextOverflow.ellipsis,)
                        ),
                        const SizedBox(width: defaultPadding),
                        Text("\$${product.price}",style: Theme.of(context).textTheme.headline6,)
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                      child: Text(product.description),
                    ),
                    const SizedBox(height: defaultPadding * 1.5,),
                    SizedBox(
                      width: 200,
                      height: 45,
                      child: ElevatedButton(
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(primary: primaryColor,shape: const StadiumBorder()),
                        child: const Text("Add to cart")
                      ),
                    )
                  ],
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
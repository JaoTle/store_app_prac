import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.image, required this.title, required this.price, required this.press,
  });

  final String  image,title;
  final dynamic price;
  final VoidCallback press;
  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        width :154,
        padding: const EdgeInsets.all(defaultPadding/2),
        decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(defaultBorderRadius)),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFFEFEFF2),
                borderRadius: BorderRadius.circular(defaultBorderRadius)
              ),
              child: Image.network(image,width: 100,height: 100,),
              height: 132,
            ),
            const SizedBox(height: defaultPadding/2,),
            Row(
              children: [
                Expanded(
                  child: Text(title,
                    style: TextStyle(color: Colors.black),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: defaultPadding/4,),
                Text("\$$price",style: Theme.of(context).textTheme.subtitle2,)
              ],
            )
          ],
        ),
      ),
    );
  }
}


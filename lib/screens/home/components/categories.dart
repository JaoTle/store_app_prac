import 'package:flutter/material.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/categories.dart';


class Categories extends StatelessWidget {
  const Categories({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: 
          List.generate(
            catagories_list.length,
            (index) => Padding(
              padding: const EdgeInsets.only(right: defaultPadding),
              child: CategoryCard(
                icon: catagories_list[index].icon,
                onPressed: (){},
                label: catagories_list[index].label,
              ),
            ),
          ),
      ),
    );
  }
}

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    super.key, required this.label, required this.icon, required this.onPressed,
  });

  final String label,icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(defaultBorderRadius))
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding/4,vertical: defaultPadding/2),
        child: Column(
          children: [
            Image.asset(icon,height: 50,width: 50,),
            const SizedBox(
              height: defaultPadding/2,
            ),
            Text(label,style: Theme.of(context).textTheme.subtitle2,textAlign: TextAlign.center,)
          ],
        ),
      )
    );
  }
}


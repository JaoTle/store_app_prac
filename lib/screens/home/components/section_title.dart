import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({
    super.key, required this.title, required this.press,
  });

  final String title;
  final VoidCallback press;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w500
          )
        ),
        TextButton(
          onPressed: press,
          child:  const Text("See All",
          style: TextStyle(
            color: Colors.black54
          )
          )
        )
      ],
    );
  }
}

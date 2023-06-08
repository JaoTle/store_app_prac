import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:store_app/constants.dart';
import 'package:store_app/models/categories.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/screens/home/components/categories.dart';
import 'package:store_app/screens/home/components/new_arrival.dart';
import 'package:store_app/screens/home/components/popular.dart';
import 'package:store_app/screens/home/components/search_form.dart';
import 'package:store_app/screens/home/components/section_title.dart';
import 'package:store_app/screens/home/components/product_card.dart';
import 'package:store_app/services/product_service.dart';

class HomeScreen extends StatelessWidget {

  ProductService productService = ProductService();
  @override

  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/menu.svg")),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset("assets/icons/Location.svg"),
            const SizedBox(width: defaultPadding/2,),
            Text("15/2 New Texas",style: Theme.of(context).textTheme.subtitle2,)
          ],
        ),
        actions: [
          IconButton(onPressed: (){}, icon: SvgPicture.asset("assets/icons/Notification.svg"))
        ],
      ),
      body: FutureBuilder(
        future: productService.getAllProducts(),
        builder:(context,snapshot){
          if(snapshot.hasData){
            return SingleChildScrollView(
              padding: const EdgeInsets.all(defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Explore",style: Theme.of(context).textTheme.headline4!.copyWith(fontWeight: FontWeight.w500,color: Colors.black),),
                  const Text("best Products for you",style: TextStyle(fontSize: 18),),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: defaultPadding),
                    child: SearchForm(),
                  ),
                  const Categories(),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  NewArrival(newArrivalProducts: productService.newArrivalProducts(snapshot.data),),
                  const SizedBox(
                    height: defaultPadding,
                  ),
                  Popular(popularProducts: productService.popularProducts(snapshot.data),)
                ],
              ),
            );
          }
          else {
            return Center(
              child: CircularProgressIndicator(color: primaryColor,)
            );
          }
        } 
      ),
    );
  }
}






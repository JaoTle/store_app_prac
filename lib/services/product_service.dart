import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:store_app/models/product_model.dart';

class ProductService {
  static const baseUrl = "https://fakestoreapi.com/";

  Future<List<ProductModel>> getAllProducts() async {
    const getAllUrl = baseUrl+"products";
    List<ProductModel> allProducts = <ProductModel>[];
    try {
      final response = await http.get(Uri.parse(getAllUrl));
      if(response.statusCode == 200){
        final jsonData = json.decode(response.body);
        for(var item in jsonData){
          allProducts.add(ProductModel.fromJson(item));
        }
        return allProducts;
      }
      else{
        throw Exception("Failed to load product");
      }
    } catch (e) {
      print("Get data error : $e");
      throw Exception("Failed to load product");
    }
  }

  List<ProductModel> popularProducts(List<ProductModel>? allProducts) {
    allProducts!.sort((item1,item2) => (item1.rating.compareTo(item2.rating)));
    return allProducts.reversed.toList().sublist(0,5);
  }

  List<ProductModel> newArrivalProducts(List<ProductModel>? allProducts) {
    allProducts!.shuffle();
    return allProducts.sublist(0,5);
  }
  
}

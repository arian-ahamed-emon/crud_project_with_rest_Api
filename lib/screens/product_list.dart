import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart';
import 'package:basic_api/screens/add_new_product_screen.dart';
import 'package:flutter/material.dart';
import '../models/product.dart';
import '../widgets/product_item.dart';
class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];
  bool _inPogress = false;

  @override
  void initState() {
    super.initState();
    getProductList();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text('Product List'),
          centerTitle: true,
          backgroundColor: Colors.blue,
        actions: [
          IconButton(onPressed: (){
            getProductList();
          }, icon: const Icon(Icons.refresh)),
    ]
      ),
      body: _inPogress ? const Center(
        child: CircularProgressIndicator(),
      ): Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
            itemBuilder: (context, index) {
              return ProductItem(
                product: productList[index],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 7,);
            },
            itemCount: productList.length),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddNewProductScreen(),));
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Future <void> getProductList() async {
    _inPogress = true;
    setState(() {
    });
    Uri uri = Uri.parse('http://164.68.107.70:6060/api/v1/ReadProduct');
    Response response = await get(uri);
    if (kDebugMode) {
      print(response);
    }
    if (kDebugMode) {
      print(response.statusCode);
    }
    if (kDebugMode) {
      print(response.body);
    }

    if (response.statusCode == 200) {
      productList.clear();
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      for (var item in jsonResponse ['data']) {
        Product product = Product(
            id: item['_id'],
            ProductName: item['ProductName'],
            ProductCode: item['ProductCode'],
            ProductImage: item['Img'],
            unitPrice: item['UnitPrice'],
            quantity: item['Qty'],
            totalPrice: item['TotalPrice'],
            createdAt: item['CreatedDate']);
        productList.add(product);
      }
    }
    _inPogress = false;
        setState(() {});
      }
    }



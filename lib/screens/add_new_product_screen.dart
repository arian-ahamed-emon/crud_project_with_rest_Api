import 'package:flutter/material.dart';

class AddNewProductScreen extends StatefulWidget {
  const AddNewProductScreen({super.key});

  @override
  State<AddNewProductScreen> createState() => _AddNewProductScreenState();
}

class _AddNewProductScreenState extends State<AddNewProductScreen> {

  final TextEditingController _productNameTEcontroller = TextEditingController();
  final TextEditingController _productCodeTEcontroller = TextEditingController();
  final TextEditingController _productPriceTEcontroller = TextEditingController();
  final TextEditingController _productQuantityTEcontroller = TextEditingController();
  final TextEditingController _productTotalPriceTEcontroller = TextEditingController();
  final GlobalKey <FormState> _formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Product'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildNewProductForm(),
      ),
    );
  }

  buildNewProductForm() {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _productNameTEcontroller,
              decoration: const InputDecoration(
                hintText: 'Name',
                labelText: 'Product Name',
              ),
            ),
            TextFormField(
              controller: _productCodeTEcontroller,
              decoration: const InputDecoration(
                hintText: 'Product Code',
                labelText: 'Product Code',
              ),
            ),
            TextFormField(
              controller: _productPriceTEcontroller,
              decoration: const InputDecoration(
                hintText: 'Price',
                labelText: 'Price',
              ),
            ),
            TextFormField(
              controller: _productQuantityTEcontroller,
              decoration: const InputDecoration(
                hintText: 'Quantity',
                labelText: 'Quantity',
              ),
            ),
            TextFormField(
              controller: _productTotalPriceTEcontroller,
              decoration: const InputDecoration(
                hintText: 'Total Price',
                labelText: 'Total Price',
              ),
            ),
            const SizedBox(height: 16,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  fixedSize: const Size.fromWidth(double.maxFinite),
                ),
                onPressed: () {
                  _ontapAddProductButton();
                },
                child: const Text('Add Product')),
          ],
        ),
      );
  }
  void _ontapAddProductButton(){

}
  @override
  void dispose() {
    _productTotalPriceTEcontroller.dispose();
    _productQuantityTEcontroller.dispose();
    _productNameTEcontroller.dispose();
    _productPriceTEcontroller.dispose();
    _productCodeTEcontroller.dispose();
    super.dispose();
  }
  }

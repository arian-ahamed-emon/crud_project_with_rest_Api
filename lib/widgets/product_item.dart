import 'package:basic_api/models/product.dart';
import 'package:basic_api/screens/update_product-screen.dart';
import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key, required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      tileColor: Colors.white,
      title: Text(product.ProductName),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Product id: ${product.id}'),
          Text('Product Code: ${product.ProductCode}'),
          Text('productImage:${product.ProductImage}'),
          Text('unit Price: \$${product.unitPrice}'),
          Text('Quantity: ${product.quantity}'),
          Text('Total Price:\$${product.totalPrice}'),
          Text('created at:${product.createdAt}'),

          const Divider(),

          OverflowBar(
            children: [
              TextButton.icon(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => const UpdateProductscreen(),));
              },
                icon:const Icon(Icons.edit),
                label: const Text('Edit'),
              ),
              TextButton.icon(onPressed: (){},
                icon:const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
                label: const Text(
                  'Delete',
                  style: TextStyle(color: Colors.red),
                ),

              ),
            ],
          )
        ],
      ),
    );
  }
}

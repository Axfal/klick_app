import 'package:klik_app/constants/colors.dart';
import 'package:flutter/material.dart';

// Dummy Product model
class DummyProduct {
  final String name;
  final String image;
  final double price;
  final double discount;

  DummyProduct({
    required this.name,
    required this.image,
    required this.price,
    required this.discount,
  });
}

// Dummy data
final List<DummyProduct> dummyProducts = [
  DummyProduct(
    name: 'Eco-Friendly T-Shirt',
    image: 'assets/images/product1.png',
    price: 29.99,
    discount: 10,
  ),
  DummyProduct(
    name: 'Organic Cotton Hoodie',
    image: 'assets/images/product2.png',
    price: 59.99,
    discount: 15,
  ),
  DummyProduct(
    name: 'Sustainable Jeans',
    image: 'assets/images/product3.png',
    price: 79.99,
    discount: 20,
  ),
];

// Cart Item with Quantity State
class CartItem extends StatefulWidget {
  final DummyProduct product;

  const CartItem({super.key, required this.product});

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    final discountedPrice =
        widget.product.price * (1 - widget.product.discount / 100);
    final total = discountedPrice * quantity;

    return Card(
      color: AppColors.whiteColor,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Image.asset(
          widget.product.image,
          width: 60,
          fit: BoxFit.contain,
        ),
        title: Text(widget.product.name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price: \$${discountedPrice.toStringAsFixed(2)} (Discount: ${widget.product.discount.toInt()}%)',
            ),
            Row(
              children: [
                IconButton(
                  onPressed: quantity > 1
                      ? () => setState(() => quantity--)
                      : null,
                  icon: const Icon(Icons.remove),
                ),
                Text(quantity.toString()),
                IconButton(
                  onPressed: () => setState(() => quantity++),
                  icon: const Icon(Icons.add),
                ),
              ],
            ),
            Text('Total: \$${total.toStringAsFixed(2)}'),
          ],
        ),
        trailing: IconButton(
          onPressed: () {
            // Optional: Remove item logic
          },
          icon: const Icon(Icons.delete, color: Colors.red),
        ),
      ),
    );
  }
}

// Main Cart Product List
class CartProductList extends StatelessWidget {
  final List<DummyProduct> products;

  const CartProductList({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: products.length,
      itemBuilder: (_, index) => CartItem(product: products[index]),
    );
  }
}

// Full Cart Screen
class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Cart')),
      body: dummyProducts.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/images/empty_cart.png', width: 150),
                  const SizedBox(height: 16),
                  const Text('Your cart is empty!'),
                ],
              ),
            )
          : Column(
              children: [
                Expanded(child: CartProductList(products: dummyProducts)),
                Container(
                  padding: const EdgeInsets.all(16),
                  width: double.infinity,
                  color: Colors.green.shade100,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to checkout
                    },
                    child: const Text('Proceed to Checkout'),
                  ),
                ),
              ],
            ),
    );
  }
}

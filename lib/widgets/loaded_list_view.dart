import 'package:flutter/material.dart';
import '../../model/product.dart';
import '../../widgets/product_card.dart';

class LoadedListView extends StatelessWidget {
  const LoadedListView({
    super.key,
    required this.products,
  });

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ProductCard(product: products[index]),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: products.length,
    );
  }
}

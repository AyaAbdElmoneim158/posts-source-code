import 'package:flutter/material.dart';
import '../widgets/loading_product_card.dart';

class LoadingListView extends StatelessWidget {
  const LoadingListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => const LoadingProductCard(),
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemCount: 20,
    );
  }
}

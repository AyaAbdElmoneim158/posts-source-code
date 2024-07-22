import 'package:flutter/material.dart';
import '../util/skeleton.dart';

class LoadingProductCard extends StatelessWidget {
  const LoadingProductCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 100,
          width: 100,
          child: Skeleton(height: 100, width: 100),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Skeleton(height: 16, width: width * 0.5),
              const SizedBox(height: 8),
              Skeleton(height: 16, width: width * 0.75),
              const SizedBox(height: 8),
              Skeleton(height: 16, width: width),
              const SizedBox(height: 8),
              Skeleton(height: 16, width: width),
            ],
          ),
        ),
      ],
    );
  }
}

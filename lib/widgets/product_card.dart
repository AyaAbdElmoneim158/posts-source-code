import 'package:flutter/material.dart';
import '../model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard(
      {super.key,
      required this.product,
      this.imageAlignment = Alignment.center,
      this.onProductPressed});

  final Product product;
  final Alignment imageAlignment;
  final Function(String)? onProductPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: GestureDetector(
        onTap: () {
          // onProductPressed?.call(product.objectID!);
        },
        child: Container(
          margin: const EdgeInsets.all(16),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Stack(
              alignment: AlignmentDirectional.bottomStart,
              children: [
                SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.network(product.image,
                        alignment: imageAlignment, fit: BoxFit.contain)),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF802c6e),
                  ),
                  child: Text(
                    " ${product.price}\$",
                    style: Theme.of(context).textTheme.caption?.copyWith(
                          color: Colors.white,
                        ),
                  ),
                )
              ],
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.category,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.caption,
                  ),
                  Text(
                    product.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    softWrap: false,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  if (product.description.isNotEmpty == true)
                    Text(
                      product.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.bodyText2?.copyWith(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                    ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

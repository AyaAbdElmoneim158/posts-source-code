import 'package:flutter/material.dart';
import '../../model/product.dart';
import 'package:dio/dio.dart';
import '../../widgets/product_card.dart';
import '../widgets/loading_product_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final dio = Dio();
  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<List<Product>> fetchProducts() async {
    try {
      var response = await dio.get("https://fakestoreapi.com/products/");

      debugPrint(response.toString());
      if (response.statusCode == 200) {
        final List<dynamic> body = response.data;
        return body.map((product) => Product.fromJson(product)).toList();
      } else {
        debugPrint(response.statusCode.toString());
        return [];
      }
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Fake Store",
          style: TextStyle(color: Color(0xFF802c6e)),
        ),
        scrolledUnderElevation: 0,
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Product>>(
            future: fetchProducts(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                // return const Center(child: CircularProgressIndicator());
                return const LoadingListView();
              } else if (snapshot.hasData) {
                final products = snapshot.data!;
                return LoadedListView(products: products);
              } else {
                return const Text("No data available");
              }
            }),
      ),
    );
  }
}

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

// https://www.algolia.com/doc/guides/building-search-ui/ecommerce-ui-template/components/in-depth/product-listing-page-display/product-card/flutter/?client=Usage
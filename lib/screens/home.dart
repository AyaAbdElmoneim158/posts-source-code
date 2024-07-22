import 'package:fakestore/services/api_services.dart';
import 'package:flutter/material.dart';
import '../../model/product.dart';
import '../widgets/custom_app_bar.dart';
import '../widgets/loaded_list_view.dart';
import '../widgets/loading_list_view.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // ApiServices.fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: _buildBody(),
    );
  }

  Padding _buildBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<List<Product>>(
          future: ApiServices.fetchProducts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // return const Center(child: CircularProgressIndicator());
              return const LoadingListView();
            } else if (snapshot.hasData) {
              final products = snapshot.data!;
              return LoadedListView(products: products);
            } else {
              return const Center(child: Text("No data available"));
            }
          }),
    );
  }
}

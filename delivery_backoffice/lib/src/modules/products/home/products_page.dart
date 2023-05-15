import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../core/ui/widgets/base_header.dart';
import 'product_controller.dart';
import 'widgets/product_item.dart';

class ProductsPage extends StatefulWidget {
  const ProductsPage({super.key});

  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {

  final controller = Modular.get<ProductController>();

  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[50],
      padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
      child: Column(
        children: [
          BaseHeader(
            title: 'ADMINISTRAR PRODUTOS',
            buttonLabel: 'ADICIONAR PRODUTO',
            buttonPressed: () {},
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: GridView.builder(
              itemCount: 10,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                mainAxisExtent: 280,
                mainAxisSpacing: 20,
                maxCrossAxisExtent: 280,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                return const ProductItem();
              },
            ),
          )
        ],
      ),
    );
  }
}

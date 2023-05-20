import 'package:flutter_modular/flutter_modular.dart';

import 'detail/product_detail_controller.dart';
import 'detail/product_detail_page.dart';
import 'home/product_controller.dart';
import 'home/products_page.dart';

class ProductsModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton((i) => ProductController(i())),
        Bind.lazySingleton(
          (i) => ProductDetailController(i()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute<ProductsPage>(
          '/',
          child: (context, args) => const ProductsPage(),
        ),
        ChildRoute<ProductDetailPage>(
          '/product-detail',
          child: (context, args) => ProductDetailPage(
            productId: int.tryParse(args.queryParams['id'] ?? 'não informado'),
          ),
        ),
      ];
}

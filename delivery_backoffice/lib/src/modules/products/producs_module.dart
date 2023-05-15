import 'package:flutter_modular/flutter_modular.dart';

import 'home/product_controller.dart';
import 'home/products_page.dart';

class ProducsModule extends Module {

   @override
   List<Bind> get binds => [
    Bind.lazySingleton((i) => ProductController(i()))
   ];

   @override
   List<ModularRoute> get routes => [
      ChildRoute('/', child: (context, args) => const ProductsPage()),
     // ChildRoute('/detail', child: ((context, args) => ))
   ];

}
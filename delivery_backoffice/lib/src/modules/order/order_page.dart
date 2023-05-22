import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import 'widgets/order_detail_modal.dart';
import 'order_controller.dart';
import 'widgets/order_header.dart';
import 'widgets/order_item.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage>
    with Loader<OrderPage>, Messages<OrderPage> {
  late final _controller = context.read<OrderController>();
  late final ReactionDisposer _statusDisposer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _statusDisposer = reaction((_) => _controller.status, (status) {
        switch (status) {
          case OrderStateStatus.initial:
            break;
          case OrderStateStatus.loading:
            showLoader();
            break;
          case OrderStateStatus.loaded:
            hideLoader();
            break;
          case OrderStateStatus.error:
            hideLoader();
            showError(_controller.errorMessage ?? 'Erro interno');
            break;
          case OrderStateStatus.showDetailModal:
            hideLoader();
            _showOrderDetail();
            break;
          case OrderStateStatus.statusChanged:
            hideLoader();
            Navigator.of(context, rootNavigator: true).pop();
            _controller.findOrders();
            break;
        }
      });
      _controller.findOrders();
    });
  }

  void _showOrderDetail() => showDialog<void>(
        context: context,
        builder: (_) => OrderDetailModal(
          controller: _controller,
          order: _controller.orderSelected!,
        ),
      );

  @override
  void dispose() {
    _statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constrains) {
        return Container(
          color: Colors.grey[50],
          padding: const EdgeInsets.only(left: 40, top: 40, right: 40),
          child: Column(
            children: [
              OrderHeader(
                controller: _controller,
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: Observer(
                  builder: (_) {
                    return GridView.builder(
                      itemCount: _controller.orders.length,
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        mainAxisExtent: 91,
                        maxCrossAxisExtent: 600,
                      ),
                      itemBuilder: (context, index) {
                        return OrderItem(order: _controller.orders[index]);
                      },
                    );
                  },
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

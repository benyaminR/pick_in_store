import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pick_in_store/home/controller/picked_orders/picked_orders_bloc.dart';
import 'package:pick_in_store/home/controller/unpicked_orders/unpicked_orders_bloc.dart';
import 'package:pick_in_store/order/view/order.dart';
import 'package:pick_in_store/pick_up_order/pick_up_order.dart';
import 'package:pick_in_store/utils/dependencies.dart';

class Home extends StatelessWidget {
  static const ROUTE = '/home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Abholbereit'),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                BorderRadius.all(Radius.circular(180))),
                        child: BlocProvider(
                            create: (context) => getIt<PickedOrdersBloc>(),
                            child: BlocBuilder<PickedOrdersBloc,
                                PickedOrdersState>(builder: (context, state) {
                              if (state.status == PickedStatus.Loaded)
                                return Center(child: Text(state.items.length.toString()));
                              return Container();
                            })),
                      ),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Neu'),
                    Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius:
                                BorderRadius.all(Radius.circular(180))),
                        child:BlocProvider(
                            create: (context) => getIt<UnpickedOrdersBloc>(),
                            child: BlocBuilder<UnpickedOrdersBloc,
                                UnpickedOrdersState>(builder: (context, state) {
                              if (state.status == UnpickedStatus.Loaded)
                                return Center(child: Text(state.items.length.toString()));
                              return Container();
                            })),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          title: Center(child: Text('Bestellungen')),
        ),
        body: TabBarView(
          children: [
            _pickedOrdersListView(context),
            _unpickedOrdersListView(context)
          ],
        ),
      ),
    );
  }

  _pickedOrdersListView(context) {
    return RefreshIndicator(
      onRefresh: () =>
          Future.value(getIt<PickedOrdersBloc>()..add(GetPickedOrdersEvent())),
      child: BlocProvider(
          create: (context) => getIt<PickedOrdersBloc>(),
          child: BlocBuilder<PickedOrdersBloc, PickedOrdersState>(
            builder: (context, state) {
              if (state.status == PickedStatus.Loading)
                return Center(
                  child: CircularProgressIndicator(),
                );
              if (state.status == PickedStatus.Loaded)
                return ListView(
                    children: state.items
                        .map((order) => Card(
                              margin: EdgeInsets.fromLTRB(8, 4, 4, 8),
                              child: ListTile(
                                onTap: () => Navigator.of(context).pushNamed(
                                    PickUpOrder.ROUTE,
                                    arguments: PickUpOrderModal(order: order)),
                                title: Text(
                                  "${order.customer.firstname} ${order.customer.surename}",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${order.articles.length} Artikel - ${order.date}"),
                                  ],
                                ),
                              ),
                            ))
                        .toList());
              if (state.status == PickedStatus.Error)
                return Center(
                  child: Text(state.msg),
                );
              return Center(
                child: Text(state.status.toString()),
              );
            },
          )),
    );
  }

  _unpickedOrdersListView(context) {
    return RefreshIndicator(
        onRefresh: () => Future.value(
            getIt<UnpickedOrdersBloc>()..add(GetUnpickedOrdersEvent())),
        child: BlocProvider(
          create: (context) => getIt<UnpickedOrdersBloc>(),
          child: BlocBuilder<UnpickedOrdersBloc, UnpickedOrdersState>(
            builder: (context, state) {
              if (state.status == UnpickedStatus.Loading)
                return Center(
                  child: CircularProgressIndicator(),
                );
              if (state.status == UnpickedStatus.Loaded)
                return ListView(
                    children: state.items
                        .map((order) => Card(
                              margin: EdgeInsets.fromLTRB(8, 4, 4, 8),
                              child: ListTile(
                                onTap: () => Navigator.of(context).pushNamed(
                                    Order.ROUTE,
                                    arguments: OrderModalData(order: order)),
                                title: Text(order.orderID),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        "${order.articles.length} Artikel - ${order.date}"),
                                  ],
                                ),
                              ),
                            ))
                        .toList());
              if (state.status == UnpickedStatus.Error)
                return Center(
                  child: Text(state.msg),
                );
              return Center(
                child: Text(state.status.toString()),
              );
            },
          ),
        ));
  }
}

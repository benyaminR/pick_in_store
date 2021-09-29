part of 'picked_orders_bloc.dart';

enum PickedStatus {Loading, Loaded, Initial, Error}

class PickedOrdersState {

  final PickedStatus status ;
  final List<ListItemOrderModel> items;
  final String msg;

  PickedOrdersState({
    this.status = PickedStatus.Initial,
    this.items = const [],
    this.msg = ''
  });

  PickedOrdersState copyWith({
    PickedStatus? status,
    List<ListItemOrderModel>? items,
    String? msg
  }){
    return PickedOrdersState(
        status: status ?? this.status,
        items: items ?? this.items,
        msg : msg ?? this.msg
    );
  }
}
part of 'unpicked_orders_bloc.dart';

enum UnpickedStatus {Loading, Loaded, Initial, Error}

class UnpickedOrdersState {

  final UnpickedStatus status ;
  final List<ListItemOrderModel> items;
  final String msg;

  UnpickedOrdersState({
    this.status = UnpickedStatus.Initial,
    this.items = const [],
    this.msg = ''
  });

  UnpickedOrdersState copyWith({
    UnpickedStatus? status,
    List<ListItemOrderModel>? items,
    String? msg
  }){
    return UnpickedOrdersState(
        status: status ?? this.status,
        items: items ?? this.items,
        msg : msg ?? this.msg
    );
  }
}
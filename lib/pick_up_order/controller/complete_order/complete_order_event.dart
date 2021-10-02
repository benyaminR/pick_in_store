part of 'complete_order_bloc.dart';

class CompleteOrderEvent extends Equatable{
  final String orderID;

  CompleteOrderEvent({required this.orderID});

  @override
  List<Object?> get props => [
    orderID
  ];

}



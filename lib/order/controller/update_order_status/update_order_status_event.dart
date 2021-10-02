part of 'update_order_status_bloc.dart';

class UpdateOrderStatusEvent extends Equatable{
  final String orderID;
  final String status;

  UpdateOrderStatusEvent({required this.orderID, required this.status});

  @override
  List<Object?> get props => [
    orderID,
    status
  ];

}
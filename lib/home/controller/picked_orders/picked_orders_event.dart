part of 'picked_orders_bloc.dart';

@immutable
abstract class PickedOrdersEvent extends Equatable{}

class GetPickedOrdersEvent extends PickedOrdersEvent{
  @override
  List<Object?> get props => [];
}

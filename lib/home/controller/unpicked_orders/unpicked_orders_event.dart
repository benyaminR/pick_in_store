part of 'unpicked_orders_bloc.dart';

@immutable
abstract class UnpickedOrdersEvent extends Equatable{}

class GetUnpickedOrdersEvent extends UnpickedOrdersEvent{
  @override
  List<Object?> get props => [];

}


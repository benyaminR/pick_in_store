part of 'complete_order_bloc.dart';

enum CompleteOrderStatus { Loading, Initial, Loaded, Error }

class CompleteOrderState extends Equatable {
  final CompleteOrderStatus status;
  final String msg;

  CompleteOrderState(
      {this.status = CompleteOrderStatus.Initial, this.msg = ''});

  @override
  List<Object?> get props => [status, msg];

  CompleteOrderState copyWith({
    CompleteOrderStatus? status,
    String? msg
  }) {
    return CompleteOrderState(
        status: status ?? this.status,
        msg: msg ?? this.msg
    );
  }
}

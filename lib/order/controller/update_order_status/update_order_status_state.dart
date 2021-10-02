part of 'update_order_status_bloc.dart';


enum UpdateOrderStatus { Loading, Initial, Loaded, Error }

class UpdateOrderStatusState extends Equatable {
  final UpdateOrderStatus status;
  final String msg;

  UpdateOrderStatusState(
      {this.status = UpdateOrderStatus.Initial, this.msg = ''});

  @override
  List<Object?> get props => [status, msg];

  UpdateOrderStatusState copyWith({
    UpdateOrderStatus? status,
    String? msg
  }) {
    return UpdateOrderStatusState(
        status: status ?? this.status,
        msg: msg ?? this.msg
    );
  }
}
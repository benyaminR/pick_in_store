import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pick_in_store/networking/mock_up_service.dart';

part 'update_order_status_event.dart';

part 'update_order_status_state.dart';

@singleton
class UpdateOrderStatusBloc
    extends Bloc<UpdateOrderStatusEvent, UpdateOrderStatusState> {
  UpdateOrderStatusBloc() : super(UpdateOrderStatusState());
  MockUpService service = MockUpService();

  @override
  Stream<UpdateOrderStatusState> mapEventToState(
      UpdateOrderStatusEvent event) async* {
    if (event is UpdateOrderStatusEvent) {

      yield state.copyWith(status: UpdateOrderStatus.Loading);
      try {

        await service.updateOrderStatus(event.status, event.orderID);

        yield state.copyWith(status: UpdateOrderStatus.Loaded);

      } catch (_) {

        yield state.copyWith(
            status: UpdateOrderStatus.Error,
            msg: 'Etwas ist schief gelaufen!');
      }
    }
  }
}

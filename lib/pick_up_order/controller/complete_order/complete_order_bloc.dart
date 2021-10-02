import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pick_in_store/networking/mock_up_service.dart';

part 'complete_order_event.dart';

part 'complete_order_state.dart';

@singleton
class CompleteOrderBloc extends Bloc<CompleteOrderEvent, CompleteOrderState> {
  MockUpService service = MockUpService();

  CompleteOrderBloc() : super(CompleteOrderState());

  @override
  Stream<CompleteOrderState> mapEventToState(CompleteOrderEvent event) async* {
    if (event is CompleteOrderEvent) {
      yield state.copyWith(status: CompleteOrderStatus.Loading);
      try {
        await service.updateOrderStatus('Completed', event.orderID);
        yield state.copyWith(status: CompleteOrderStatus.Loaded);
      } catch (_) {
        yield state.copyWith(
            status: CompleteOrderStatus.Error,
            msg: 'Etwas ist schief gelaufen!');
      }
    }
  }
}

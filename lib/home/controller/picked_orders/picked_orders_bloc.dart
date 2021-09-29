import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pick_in_store/home/model/list_item_order_model.dart';
import 'package:pick_in_store/networking/mock_up_service.dart';
import 'package:pick_in_store/utils/xml_converter.dart';

part 'picked_orders_event.dart';

part 'picked_orders_state.dart';

@singleton
class PickedOrdersBloc extends Bloc<PickedOrdersEvent, PickedOrdersState> {

  PickedOrdersBloc() : super(PickedOrdersState(status: PickedStatus.Initial)){
    add(GetPickedOrdersEvent());
  }

  MoveUpService service = MoveUpService();
  XMLConverter converter = XMLConverter();

  @override
  Stream<PickedOrdersState> mapEventToState(PickedOrdersEvent event) async* {
    if(event is GetPickedOrdersEvent){
      try{
        yield state.copyWith(
            status: PickedStatus.Loading
        );
        var rawXMLResponse = await service.getPickedOrders();
        var converted = converter.convertXMLOrdersToListItemOrders(rawXMLResponse);

        yield state.copyWith(
            status: PickedStatus.Loaded,
            items: converted
        );

      }catch(e){
        print(e.toString());
        yield state.copyWith(
            status: PickedStatus.Error,
            msg: 'etwas ist schiefgelaufen! Versuchen Sie bitte später.'
        );
      }

    }
  }
}

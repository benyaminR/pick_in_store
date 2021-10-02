import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:pick_in_store/home/model/list_item_order_model.dart';
import 'package:pick_in_store/networking/mock_up_service.dart';
import 'package:pick_in_store/utils/xml_converter.dart';

part 'unpicked_orders_event.dart';

part 'unpicked_orders_state.dart';

@singleton
class UnpickedOrdersBloc extends Bloc<UnpickedOrdersEvent, UnpickedOrdersState> {

  UnpickedOrdersBloc() : super(UnpickedOrdersState(status: UnpickedStatus.Initial));

  MockUpService service = MockUpService();
  XMLConverter converter = XMLConverter();

  @override
  Stream<UnpickedOrdersState> mapEventToState(
      UnpickedOrdersEvent event) async* {
    if(event is GetUnpickedOrdersEvent){
      try{
        yield state.copyWith(
            status: UnpickedStatus.Loading
        );
        var rawXMLResponse = await service.getUnpickedOrders();
        var converted = converter.convertXMLOrdersToListItemOrders(rawXMLResponse);

        yield state.copyWith(
            status: UnpickedStatus.Loaded,
            items: converted
        );

      }catch(e){
        print(e.toString());
        yield state.copyWith(
            status: UnpickedStatus.Error,
            msg: 'etwas ist schiefgelaufen! Versuchen Sie bitte später.'
        );
      }

    }
  }
}

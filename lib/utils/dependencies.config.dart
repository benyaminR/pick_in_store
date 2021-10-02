// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../home/controller/picked_orders/picked_orders_bloc.dart' as _i4;
import '../home/controller/unpicked_orders/unpicked_orders_bloc.dart' as _i5;
import '../order/controller/update_order_status/update_order_status_bloc.dart'
    as _i6;
import '../pick_up_order/controller/complete_order/complete_order_bloc.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.CompleteOrderBloc>(_i3.CompleteOrderBloc());
  gh.singleton<_i4.PickedOrdersBloc>(_i4.PickedOrdersBloc());
  gh.singleton<_i5.UnpickedOrdersBloc>(_i5.UnpickedOrdersBloc());
  gh.singleton<_i6.UpdateOrderStatusBloc>(_i6.UpdateOrderStatusBloc());
  return get;
}

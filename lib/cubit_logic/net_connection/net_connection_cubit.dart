import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'net_connection_state.dart';

class NetConnectionCubit extends Cubit<NetConnectionState> {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription _connectivityStreamSubscription;

  NetConnectionCubit() : super(NetLoading()) {
    checkNet();
    _connectivityStreamSubscription =
        _connectivity.onConnectivityChanged.listen(
      (result) {
        if (result == ConnectivityResult.none) {
          emitNetDisConnected();
        } else {
          emitNetConnected();
        }
      },
    );
  }

  void checkNet() async{
    if((await _connectivity.checkConnectivity()) == ConnectivityResult.none){
      emitNetDisConnected();
    }else{
      emitNetConnected();
    }
  }

  void emitNetConnected() => emit(NetConnected());

  void emitNetDisConnected() => emit(NetDisconnected());

  /// close(cancel) _connectivityStreamSubscription
  /// but we know in all of app lifecycle this stream must be live
  /// so this function never be run
  @override
  Future<void> close() {
    _connectivityStreamSubscription.cancel();
    return super.close();
  }
}

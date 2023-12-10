import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<InternetEvent, InternetState> {
  StreamSubscription? _subscription;
  ConnectionBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {
      if (event is ConnectedEvent) {
        emit(ConnectedState(message: "Connected"));
      } else if (event is NotConnectedEvent) {
        emit(NotConnectedState(message: "Not Connected"));
      }
    });

    _subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.wifi ||
          result == ConnectivityResult.mobile) {
        add(ConnectedEvent());
      } else {
        add(NotConnectedEvent());
      }
    });
  }
  @override
  Future<void> close() {
    _subscription!.cancel();
    return super.close();
  }
}

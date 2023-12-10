part of 'connection_bloc.dart';

@immutable
abstract class InternetEvent {}

class ConnectedEvent extends InternetEvent {}

class NotConnectedEvent extends InternetEvent {}

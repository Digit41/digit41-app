part of 'net_connection_cubit.dart';

@immutable
abstract class NetConnectionState {}

class NetLoading extends NetConnectionState {}

class NetConnected extends NetConnectionState{}

class NetDisconnected extends NetConnectionState{}
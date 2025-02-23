part of 'drivers_cubit.dart';

@immutable
sealed class DriversState {}

final class DriversInitial extends DriversState {}

final class LoadingState extends DriversState {}

final class SuccessState extends DriversState {}

final class LoadingUploadedState extends DriversState {}

final class SuccessUploadedState extends DriversState {}

final class ErrorUploadedState extends DriversState {
  final String text;
  ErrorUploadedState({required this.text});
}

final class ErrorState extends DriversState {
  final String text;
  ErrorState({required this.text});
}

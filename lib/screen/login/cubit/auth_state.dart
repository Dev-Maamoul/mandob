part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitialState extends AuthState {}

final class LoadingLoginState extends AuthState {}

final class LoadingOTPState extends AuthState {}

final class SuccessLoginState extends AuthState {}

final class SuccessVerifyState extends AuthState {}

final class ErrorState extends AuthState {
  final String text;
  ErrorState({required this.text});
}

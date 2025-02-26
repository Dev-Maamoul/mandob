part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}

final class LoadedStateInit extends EditProfileState {}
final class LoadedUpdateStateInit extends EditProfileState {}
final class SuccessStateInit extends EditProfileState {}
final class SuccessChangeImageStateInit extends EditProfileState {}
final class ErrorState extends EditProfileState {}

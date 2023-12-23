part of 'user_cubit.dart';

sealed class UserState {}

final class UserInitial extends UserState {}

final class FetchUserLoading extends UserState {}

final class FetchUserSuccess extends UserState {}

final class FetchUserNoData extends UserState {}

final class FetchUserEror extends UserState {
  final String text;

  FetchUserEror(this.text);
}

final class FetchMoreUserLoading extends UserState {}

final class FetchMoreUserSuccess extends UserState {}

final class UpdateSelectedName extends UserState {
  final String text;

  UpdateSelectedName(this.text);
}

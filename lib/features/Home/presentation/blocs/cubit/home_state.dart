part of 'home_cubit.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoding extends HomeState {}

final class HomeFailure extends HomeState {
  final String errMessage;

  HomeFailure(this.errMessage);
}

final class Homesuccess extends HomeState {
  final List<ClassesEntity> semsters;

  Homesuccess(this.semsters);
}

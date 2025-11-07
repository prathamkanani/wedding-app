import 'package:user_profile/domain/entities/user_entity.dart';

abstract class UserProfileState {}

class UserProfileInitialState extends UserProfileState {}

class UserProfileLoadingState extends UserProfileState {}

class UserProfileLoadedState extends UserProfileState {
  final UserEntity user;
  UserProfileLoadedState(this.user);
}

class UserProfileUpdatingState extends UserProfileState {
  final UserEntity user;
  UserProfileUpdatingState(this.user);
}

class UserProfileUpdatedState extends UserProfileState {}

class UserProfileError extends UserProfileState {
  final Error error;
  UserProfileError(this.error);
}

import 'package:bloc/bloc.dart';
import 'package:user_profile/application/logic/user_profile_cubit/user_profile_state.dart';
import 'package:user_profile/domain/entities/user_entity.dart';
import 'package:user_profile/domain/repository/user_repository.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  final UserRepository repository;
  UserProfileCubit({required this.repository}) : super(UserProfileInitialState());

  Future<void> loadProfile() async {
    emit(UserProfileLoadingState());
    try {
      final user = await repository.getUserProfile();
      emit(UserProfileLoadedState(user));
    } catch(error) {
      emit(UserProfileError(error as Error));
    }
  }

  Future<void> editProfile(UserEntity user) async {
    emit(UserProfileUpdatingState(user));
    try {
      await repository.updateUserProfile(user);
      emit(UserProfileUpdatedState());
      loadProfile();
    } catch(error) {
      emit(UserProfileError(error as Error));
    }
  }
}
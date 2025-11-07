import 'package:user_profile/domain/entities/user_entity.dart';

abstract class UserRepository{
  Future<UserEntity> getUserProfile();
  Future<void> updateUserProfile(UserEntity user);
}
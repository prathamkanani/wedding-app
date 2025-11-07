import 'package:user_profile/domain/entities/user_entity.dart';
import 'package:user_profile/domain/repository/user_repository.dart';
import 'package:user_profile/infrastructure/dto/user_dto.dart';

import '../data_source/remote_data_source.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource remoteDataSource;
  UserRepositoryImpl(this.remoteDataSource);

  @override
  Future<UserEntity> getUserProfile() async {
    final UserEntity userDto = await remoteDataSource.fetchUserProfile();
    return userDto;
  }

  @override
  Future<void> updateUserProfile(UserEntity user) async {
    return remoteDataSource.updateUserProfile(UserDto.fromEntity(user));
  }
}

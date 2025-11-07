import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:user_profile/domain/entities/user_entity.dart';

import '../dto/user_dto.dart';

abstract class UserRemoteDataSource {
  Future<UserEntity> fetchUserProfile();
  Future<void> updateUserProfile(UserEntity user);
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  UserEntity? dummyUser;

  @override
  Future<UserEntity> fetchUserProfile() async {
    if(dummyUser != null) return dummyUser!;
    String data = await rootBundle.loadString('assets/static/user.json');
    Map<String, dynamic> jsonData = jsonDecode(data);
    return UserDto.fromJson(jsonData);
  }

  @override
  Future<void> updateUserProfile(UserEntity user) async {
    await Future.delayed(const Duration(milliseconds: 500));
    dummyUser = user;
  }
}
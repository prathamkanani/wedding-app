import 'package:user_profile/domain/entities/user_entity.dart';

class UserDto extends UserEntity {
  const UserDto({
    required super.id,
    required super.fullName,
    required super.email,
    required super.avatarUrl,
    required super.relation,
    required super.contactInfo,
    required super.aboutMe,
    required super.occupation,
    required super.hobbies,
  });
  
  factory UserDto.fromEntity(final UserEntity entity) {
    return UserDto(
      id: entity.id,
      fullName: entity.fullName,
      email: entity.email,
      avatarUrl: entity.avatarUrl,
      relation: entity.relation,
      contactInfo: entity.contactInfo,
      aboutMe: entity.aboutMe,
      occupation: entity.occupation,
      hobbies: entity.hobbies,
    );
  }

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
      id: json['id'] as String,
      fullName: json['fullName'] as String,
      email: json['email'] as String,
      avatarUrl: json['avatarUrl'] as String,
      relation: json['relation'] as String,
      contactInfo: json['contactInfo'] as String,
      aboutMe: json['aboutMe'] as String,
      occupation: json['occupation'] as String,
      hobbies: json['hobbies'] as String,
    );
  }
}

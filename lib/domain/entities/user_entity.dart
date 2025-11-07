class UserEntity {
  final String id;
  final String fullName;
  final String email;
  final String avatarUrl;
  final String relation;
  final String? contactInfo;
  final String? aboutMe;
  final String? occupation;
  final String? hobbies;

  const UserEntity({
    required this.id,
    required this.fullName,
    required this.email,
    required this.avatarUrl,
    required this.relation,
    required this.contactInfo,
    required this.aboutMe,
    required this.occupation,
    required this.hobbies,
  });
}

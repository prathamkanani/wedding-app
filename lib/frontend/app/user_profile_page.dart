import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile/application/logic/user_profile_cubit/user_profile_cubit.dart';
import 'package:user_profile/application/logic/user_profile_cubit/user_profile_state.dart';
import 'package:user_profile/domain/entities/user_entity.dart';
import 'package:user_profile/frontend/config/app_gap.dart';

import 'edit_profile_page.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'User Profile',
          style: textTheme.titleLarge!.copyWith(color: colorScheme.primary),
        ),
      ),
      body: SafeArea(
        child: BlocBuilder<UserProfileCubit, UserProfileState>(
          builder: (context, state) {
            if (state is UserProfileLoadingState) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is UserProfileLoadedState) {
              final UserEntity user = state.user;
              return SingleChildScrollView(
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: -MediaQuery.sizeOf(context).height * 0.38,
                      child: Container(
                        width: MediaQuery.sizeOf(context).width * 1.5,
                        height: MediaQuery.sizeOf(context).width * 1.5,
                        decoration: const BoxDecoration(
                          color: Color.fromRGBO(251, 248, 242, 1),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 90),
                          ProfileHeader(user: user),
                          AppGap.px16,
                          Center(
                            child: Text(
                              user.fullName,
                              style: textTheme.titleLarge,
                            ),
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () async {
                                final updated = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => EditProfilePage(user: user),
                                  ),
                                );
                                if (updated == true && context.mounted) {
                                  context
                                      .read<UserProfileCubit>()
                                      .loadProfile();
                                }
                              },
                              child: Text(
                                'Edit Profile',
                                style: textTheme.bodySmall!.copyWith(
                                  color: colorScheme.primary,
                                ),
                              ),
                            ),
                          ),
                          AppGap.px16,
                          Text('General Details', style: textTheme.titleMedium),
                          AppGap.px12,
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(251, 248, 242, 1),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text('Email ID'),
                                  subtitle: Text(
                                    user.email,
                                    style: TextStyle(
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Phone Number'),
                                  subtitle: Text(
                                    user.contactInfo ?? '',
                                    style: TextStyle(
                                      color: colorScheme.primary,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Relation to the couple'),
                                  subtitle: Text(
                                    user.relation,
                                    style: TextStyle(
                                      color: colorScheme.onSecondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          AppGap.px16,
                          Text(
                            'Personal Information',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const SizedBox(height: 12),
                          Container(
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(251, 248, 242, 1),
                            ),
                            child: Column(
                              children: [
                                ListTile(
                                  title: const Text('About Me'),
                                  subtitle: Text(
                                    user.aboutMe ?? '',
                                    style: TextStyle(
                                      color: colorScheme.onSecondary,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Occupation'),
                                  subtitle: Text(
                                    user.occupation ?? '',
                                    style: TextStyle(
                                      color: colorScheme.onSecondary,
                                    ),
                                  ),
                                ),
                                ListTile(
                                  title: const Text('Hobbies'),
                                  subtitle: Text(
                                    user.hobbies ?? '',
                                    style: TextStyle(
                                      color: colorScheme.onSecondary,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return const Center(child: Text('Failed to load User Profile'));
            }
          },
        ),
      ),
    );
  }
}

class ProfileHeader extends StatelessWidget {
  final UserEntity user;
  const ProfileHeader({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          SizedBox(
            height: 100,
            child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.avatarUrl),
            ),
          ),
          Positioned(
            top: 75,
            left: 75,
            child: Container(
              height: 25,
              width: 25,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromRGBO(255, 255, 255, 1),
              ),
              child: const Center(
                child: Icon(
                  Icons.camera_alt_outlined,
                  size: 20,
                  color: Color.fromRGBO(154, 33, 67, 1),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

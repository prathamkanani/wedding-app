import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile/application/logic/user_profile_cubit/user_profile_cubit.dart';
import 'package:user_profile/application/logic/user_profile_cubit/user_profile_state.dart';
import 'package:user_profile/domain/entities/user_entity.dart';
import 'package:user_profile/frontend/app/user_profile_page.dart';
import 'package:user_profile/frontend/config/app_gap.dart';

class EditProfilePage extends StatefulWidget {
  final UserEntity user;
  const EditProfilePage({super.key, required this.user});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController nameController;
  late TextEditingController phoneController;
  late TextEditingController aboutController;
  late TextEditingController occupationController;
  late TextEditingController hobbiesController;
  late String relation;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.fullName);
    phoneController = TextEditingController(text: widget.user.contactInfo);
    aboutController = TextEditingController(text: widget.user.aboutMe);
    occupationController = TextEditingController(text: widget.user.occupation);
    hobbiesController = TextEditingController(text: widget.user.hobbies);
    relation = widget.user.relation;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit User Profile')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: BlocConsumer<UserProfileCubit, UserProfileState>(
        listener: (context, state) {
          if (state is UserProfileUpdatedState) Navigator.of(context).pop();
        },
        builder: (context, state) {
          final bool isLoading = state is UserProfileUpdatingState;
          return Padding(
            padding: const EdgeInsets.only(right: 16, left: 16, bottom: 4),
            child: SizedBox(
              width: double.infinity,
              child: FilledButton.icon(
                onPressed: isLoading
                    ? null
                    : () {
                        context.read<UserProfileCubit>().editProfile(
                          UserEntity(
                            id: widget.user.id,
                            fullName: nameController.text,
                            email: widget.user.email,
                            avatarUrl: widget.user.avatarUrl,
                            relation: relation,
                            contactInfo: phoneController.text,
                            aboutMe: aboutController.text,
                            occupation: occupationController.text,
                            hobbies: hobbiesController.text,
                          ),
                        );
                      },
                icon: isLoading ? const CupertinoActivityIndicator() : null,
                label: const Text("Update Profile"),
              ),
            ),
          );
        },
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 80),
          child: SingleChildScrollView(
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
                      ProfileHeader(user: widget.user),
                      AppGap.px16,
                      Text(
                        'General Details',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      AppGap.px16,
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Full Name',
                              style: TextStyle(
                                color: Color.fromRGBO(28, 28, 30, 1),
                              ),
                            ),
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                color: Color.fromRGBO(179, 38, 30, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppGap.px08,
                      TextField(
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: 'Full Name',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      AppGap.px16,
                      RichText(
                        text: const TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Relation to the couple',
                              style: TextStyle(
                                color: Color.fromRGBO(28, 28, 30, 1),
                              ),
                            ),
                            TextSpan(
                              text: '*',
                              style: TextStyle(
                                color: Color.fromRGBO(179, 38, 30, 1),
                              ),
                            ),
                          ],
                        ),
                      ),
                      AppGap.px08,
                      DropdownButtonFormField(
                        items: ['Cousin', 'Friend', 'Sibling', 'Other']
                            .map(
                              (r) => DropdownMenuItem(
                                value: r,
                                child: Text(
                                  r,
                                  style: Theme.of(context).textTheme.bodyLarge,
                                ),
                              ),
                            )
                            .toList(),
                        initialValue: widget.user.relation,
                        onChanged: (val) {
                          setState(() {
                            relation = val ?? widget.user.relation;
                          });
                        },
                        decoration: InputDecoration(
                          hintText: 'Relation to the couple',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      AppGap.px16,
                      const Text('Phone number'),
                      AppGap.px08,
                      TextField(
                        controller: phoneController,
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      AppGap.px16,
                      Text(
                        'Personal Information',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      AppGap.px16,
                      const Text('About Me'),
                      AppGap.px08,
                      TextField(
                        controller: aboutController,
                        maxLength: 150,
                        minLines: 2,
                        maxLines: 5,
                        decoration: InputDecoration(
                          hintText: 'About Me',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      AppGap.px16,
                      const Text('Occupation'),
                      AppGap.px08,
                      TextField(
                        controller: occupationController,
                        decoration: InputDecoration(
                          hintText: 'Occupation',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      AppGap.px16,
                      const Text('Hobbies'),
                      AppGap.px08,
                      TextField(
                        controller: hobbiesController,
                        decoration: InputDecoration(
                          hintText: 'Hobbies',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    aboutController.dispose();
    phoneController.dispose();
    occupationController.dispose();
    hobbiesController.dispose();
    super.dispose();
  }
}

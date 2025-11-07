import 'package:flutter/material.dart';
import 'package:user_profile/domain/entities/user_entity.dart';
import 'package:user_profile/frontend/app/user_profile_page.dart';
import 'package:user_profile/frontend/config/app_theme.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dashboard',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'More',
            style: textTheme.titleLarge!.copyWith(color: colorScheme.primary),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              InkWell(
                onTap: () => navigateToUserProfile(context),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 100,
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(251, 248, 242, 1),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundColor: colorScheme.primary,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Sumita Seth',
                              style: textTheme.titleMedium!.copyWith(
                                color: colorScheme.onSecondary,
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () => navigateToUserProfile(context),
                                child: Text(
                                  'View Profile',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: colorScheme.primary,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

void navigateToUserProfile(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => const UserProfilePage(),
    ),
  );
}
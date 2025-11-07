import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_profile/application/logic/user_profile_cubit/user_profile_cubit.dart';
import 'package:user_profile/application/service/app_injector.dart';
import 'package:user_profile/application/service/locator.dart';
import 'package:user_profile/frontend/app/more_info_page.dart';
import 'package:user_profile/frontend/config/app_theme.dart';

void main() async {
  await DInjector().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          UserProfileCubit(repository: LocatorImpl.instance.get())
            ..loadProfile(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        home: const MoreInfoPage(),
      ),
    );
  }
}

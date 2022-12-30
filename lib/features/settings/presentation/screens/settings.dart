import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/layout/cubit/states.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/service/service_locator.dart';
import 'package:shop_now/features/settings/presentation/widgets/build_profile_item.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        cubit.nameController.text = cubit.profile!.data.name;
        cubit.emailController.text = cubit.profile!.data.email;
        cubit.phoneController.text = cubit.profile!.data.phone;
        return ConditionalBuilder(
          condition: cubit.profile != null,
          builder: (context) => BuildProfileItem(
              profile: cubit.profile!,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

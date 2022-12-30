import 'package:flutter/material.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/strings_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/core/utils/widgets/my_form_field.dart';
import 'package:shop_now/features/settings/domain/entities/profile.dart';

class BuildProfileItem extends StatelessWidget {
  final Profile profile;

  const BuildProfileItem({Key? key, required this.profile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  alignment: AlignmentDirectional.bottomEnd,
                  children: [
                    CircleAvatar(
                      radius: AppSize.s70,
                      backgroundImage: NetworkImage(
                        profile.data.image.toString(),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const CircleAvatar(
                        radius: AppSize.s20,
                        child: Icon(
                          Icons.edit,
                          size: AppSize.s15,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: AppSize.s50,
              ),
              Text(
                AppStrings.profile,
                style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                      color: ColorManager.sBlack,
                    ),
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              MyFormField(
                controller: HomeCubit.get(context).nameController,
                type: TextInputType.text,
                label: 'name',
                prefix: Icons.person,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              MyFormField(
                controller: HomeCubit.get(context).emailController,
                type: TextInputType.emailAddress,
                label: 'email address',
                prefix: Icons.email_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: AppSize.s20,
              ),
              MyFormField(
                controller: HomeCubit.get(context).phoneController,
                type: TextInputType.phone,
                label: 'phone',
                prefix: Icons.email_outlined,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter Your Phone';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

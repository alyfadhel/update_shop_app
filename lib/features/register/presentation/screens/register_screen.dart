import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/strings_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/core/service/servic_locator.dart';
import 'package:shop_now/core/utils/widgets/my_button.dart';
import 'package:shop_now/core/utils/widgets/my_form_field.dart';
import 'package:shop_now/core/utils/widgets/toast_state.dart';
import 'package:shop_now/features/login/presentation/screens/login.dart';
import 'package:shop_now/features/register/domain/entities/register.dart';
import 'package:shop_now/features/register/presentation/controller/cubit/cubit.dart';
import 'package:shop_now/features/register/presentation/controller/cubit/states.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<RegisterCubit>(),
      child: BlocConsumer<RegisterCubit, RegisterStates>(
        listener: (context, state) {
          if (state is GetRegisterUserSuccessState) {
            if (state.register.status) {
              showToast(
                text: state.register.message,
                state: ToastState.success,
              );
              sl<SharedPreferences>()
                  .setString(
                'token',
                state.register.data!.token,
              )
                  .then((value) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              });
            } else {
              showToast(
                text: state.register.message,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = RegisterCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: Padding(
              padding: const EdgeInsets.all(AppPadding.p20),
              child: Center(
                child: SingleChildScrollView(
                  child: Form(
                    key: cubit.formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.register,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                color: ColorManager.sBlack,
                                fontStyle: FontStyle.italic,
                              ),
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Text(
                          AppStrings.registerTitle,
                          style:
                              Theme.of(context).textTheme.titleLarge!.copyWith(
                                    color: ColorManager.grey,
                                    fontStyle: FontStyle.italic,
                                  ),
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: cubit.nameController,
                          type: TextInputType.text,
                          label: 'name',
                          prefix: Icons.person,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: cubit.emailController,
                          type: TextInputType.emailAddress,
                          label: 'email address',
                          prefix: Icons.email_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: cubit.phoneController,
                          type: TextInputType.phone,
                          label: 'phone',
                          prefix: Icons.phone_android_outlined,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        MyFormField(
                          controller: cubit.passwordController,
                          type: TextInputType.visiblePassword,
                          label: 'password',
                          prefix: Icons.lock_outline,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                          suffix: cubit.suffix,
                          isPassword: cubit.isPassword,
                          onPressed: () {
                            cubit.changePasswordVisibility();
                          },
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        ConditionalBuilder(
                          condition: state is! GetRegisterUserLoadingState,
                          builder: (context) => MyButton(
                            onPressedTextButton: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.getRegisterUser(
                                  name: cubit.nameController.text,
                                  email: cubit.emailController.text,
                                  phone: cubit.phoneController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: AppStrings.register,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: ColorManager.sWhite,
                                  fontStyle: FontStyle.italic,
                                ),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

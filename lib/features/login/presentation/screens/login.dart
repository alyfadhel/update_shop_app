import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shop_now/core/layout/home_layout.dart';
import 'package:shop_now/core/network/end-points.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/strings_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/core/service/service_locator.dart';
import 'package:shop_now/core/utils/widgets/my_button.dart';
import 'package:shop_now/core/utils/widgets/my_form_field.dart';
import 'package:shop_now/core/utils/widgets/my_textButton.dart';
import 'package:shop_now/core/utils/widgets/toast_state.dart';
import 'package:shop_now/features/login/presentation/controller/cubit/cubit.dart';
import 'package:shop_now/features/login/presentation/controller/cubit/states.dart';
import 'package:shop_now/features/register/presentation/screens/register_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => sl<LoginCubit>(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, state) {
          if (state is GetUserLoginSuccessState) {
            if (state.login.status) {
              showToast(
                text: state.login.message,
                state: ToastState.success,
              );
              sl<SharedPreferences>().setString(
                'token',
                state.login.data!.token,
              ).then((value)
              {
                if(value){
                  token = state.login.data!.token;
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomeLayout(),
                    ),
                  );
                }
              });
            } else {
              showToast(
                text: state.login.message,
                state: ToastState.error,
              );
            }
          }
        },
        builder: (context, state) {
          var cubit = LoginCubit.get(context);
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
                          AppStrings.login,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(
                                  color: ColorManager.sBlack,
                                  fontStyle: FontStyle.italic),
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Text(
                          AppStrings.loginTitle,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: ColorManager.grey,
                                  fontStyle: FontStyle.italic),
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
                          onPressed: () {
                            cubit.changeLoginPasswordVisibility();
                          },
                          isPassword: cubit.isPassword,
                        ),
                        const SizedBox(
                          height: AppSize.s20,
                        ),
                        ConditionalBuilder(
                          condition: state is! GetUserLoginLoadingState,
                          builder: (context) => MyButton(
                            onPressedTextButton: () {
                              if (cubit.formKey.currentState!.validate()) {
                                cubit.getUserLogin(
                                  email: cubit.emailController.text,
                                  password: cubit.passwordController.text,
                                );
                              }
                            },
                            text: AppStrings.login,
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(
                                  color: ColorManager.sWhite,
                                ),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.s10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(AppStrings.haveNotAccount),
                            MyTextButton(
                              onPressedTextButton: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const RegisterScreen(),
                                  ),
                                );
                              },
                              text: AppStrings.registerHere,
                            ),
                          ],
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

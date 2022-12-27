import 'package:flutter/material.dart';
import 'package:shop_now/core/resources/assets_manager.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/strings_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/core/utils/widgets/my_button.dart';
import 'package:shop_now/features/on_boarding/on_boarding.dart';

class WelcomeOnBoardingScreen extends StatelessWidget {
  const WelcomeOnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.sWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppSize.s20,
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Image.asset(
                  fit: BoxFit.cover,
                  ImageAssets.home,
                ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p20),
                  child: MyButton(
                    onPressedTextButton: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const OnBoardingScreen(),
                        ),
                      );
                    },
                    text: AppStrings.getStarted,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: ColorManager.sWhite,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

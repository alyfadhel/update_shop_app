import 'package:flutter/material.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/on_boarding/model/on_boarding_model.dart';

class BuildOnBoarding extends StatelessWidget {
  final OnBoardingModel model;

  const BuildOnBoarding({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(AppPadding.p20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image(
            image: AssetImage(
              model.image,
            ),
          ),
          const SizedBox(
            height: AppSize.s30,
          ),
          Text(
            model.title,
            style: Theme.of(context).textTheme.headlineMedium!.copyWith(
              color: ColorManager.sBlack
            ),
          ),
          const SizedBox(
            height: AppSize.s20,
          ),
          Text(
            model.body,
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: ColorManager.sBlack
            ),
          ),
        ],
      ),
    );
  }
}

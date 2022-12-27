import 'package:shop_now/core/resources/assets_manager.dart';
import 'package:shop_now/core/resources/strings_manager.dart';

class OnBoardingModel {
  final String image;
  final String title;
  final String body;

  OnBoardingModel({
    required this.image,
    required this.title,
    required this.body,
  });
}

List<OnBoardingModel> boarding = [
  OnBoardingModel(
    image: ImageAssets.boarding1,
    title: AppStrings.title1,
    body: AppStrings.body1,
  ),
  OnBoardingModel(
    image: ImageAssets.boarding2,
    title: AppStrings.title2,
    body: AppStrings.body2,
  ),
  OnBoardingModel(
    image: ImageAssets.boarding3,
    title: AppStrings.title3,
    body: AppStrings.body3,
  ),
];

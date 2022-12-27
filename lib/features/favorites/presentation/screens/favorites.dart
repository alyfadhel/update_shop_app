import 'package:flutter/material.dart';
import 'package:shop_now/core/resources/color_manager.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Favorites Screen',
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(
          color: ColorManager.sBlack,
        ),
      ),
    );
  }
}

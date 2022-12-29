import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/layout/cubit/states.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/favorites/presentation/widgets/build_favorites_item.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return ConditionalBuilder(
          condition: State is! GetFavoritesLoadingState,
          builder: (context) => ListView.separated(
            itemBuilder: (context, index) => BuildFavoritesItem(model: cubit.model[index]),
            separatorBuilder: (context, index) => const Padding(
              padding: EdgeInsetsDirectional.only(
                start: AppSize.s20,
                end: AppSize.s20,
              ),
              child: Divider(
                height: AppSize.s1,
                color: ColorManager.grey,
              ),
            ),
            itemCount: cubit.model.length,
          ),
          fallback: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }
}

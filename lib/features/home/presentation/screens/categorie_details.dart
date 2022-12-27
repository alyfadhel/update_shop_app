import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/layout/cubit/states.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/core/service/servic_locator.dart';
import 'package:shop_now/features/home/presentation/widgets/show_categories_details.dart';

class CategoriesDetailsScreen extends StatelessWidget {
  final int id;

  const CategoriesDetailsScreen({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) =>
          sl<HomeCubit>()..getCategoriesDetails(id),
      child: BlocConsumer<HomeCubit, HomeStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeCubit.get(context);
          return Scaffold(
            appBar: AppBar(),
            body: ConditionalBuilder(
              condition: cubit.categoriesDataDetails != null,
              builder: (context) => ListView.separated(
                itemBuilder: (context, index) => ShowCategoriesDetails(dataDetailsItem: cubit.categoriesDataDetails!.data[index]),
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
                itemCount: cubit.categoriesDataDetails!.data.length,
              ),
              fallback: (context) => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          );
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/layout/cubit/states.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/home/presentation/widgets/show_categories_screen.dart';

class CategoriesHomeScreen extends StatelessWidget {
  const CategoriesHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return SizedBox(
          height: AppSize.s150,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => ShowCategories(model: cubit.dataCategories!.data[index]),
            itemCount: cubit.dataCategories!.data.length,
          ),
        );
      },

    );
  }
}
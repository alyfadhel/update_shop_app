import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_now/core/layout/cubit/cubit.dart';
import 'package:shop_now/core/layout/cubit/states.dart';
import 'package:shop_now/core/resources/color_manager.dart';
import 'package:shop_now/core/resources/values_manager.dart';
import 'package:shop_now/features/notification/domain/entities/notification.dart';
import 'package:shop_now/features/notification/presentation/widgets/build_notification_item.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit,HomeStates>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: AppBar(),
          body: ConditionalBuilder(
            condition: cubit.notificationMsg != null,
            builder: (context) => ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) => BuildNotificationItem(dataDetails: cubit.notificationMsg!.data.data[index],),
              separatorBuilder: (context, index) => const Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: AppSize.s20
                ),
                child: Divider(
                  height: AppSize.s1,
                  color: ColorManager.grey,
                ),
              ),
              itemCount: cubit.notificationMsg!.data.data.length,
            ),
            fallback: (context) => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}

